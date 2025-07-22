import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, lfilter
from concurrent.futures import ProcessPoolExecutor
from functools import partial
from multiprocessing import cpu_count
import scienceplots

plt.style.use('science')
plt.rcParams["figure.figsize"] = (18, 8)
plt.rc('font', size=16)
plt.rc('axes', titlesize=22)
plt.rc('axes', labelsize=22)
plt.rc('xtick', labelsize=16)
plt.rc('ytick', labelsize=16)
plt.rc('legend', fontsize=16)
plt.rc('figure', titlesize=22)

# Parâmetros
fs = 100_000
fc = 10_000
N = 500_000
samples_per_bit = 100
snr_range = np.arange(-5, 15.5, 0.5)
num_trials = 5

def lowpass_filter(signal, cutoff, fs, order=6):
    b, a = butter(order, cutoff / (0.5 * fs), btype='low')
    return lfilter(b, a, signal)

# Modulação M-PSK
def psk_modulate(bits, fc, fs, samples_per_symbol, M):
    k = int(np.log2(M))
    symbols = bits.reshape(-1, k)
    symbol_indices = symbols.dot(1 << np.arange(k)[::-1])
    phase_angles = 2 * np.pi * symbol_indices / M

    t = np.arange(0, len(symbol_indices) * samples_per_symbol) / fs
    phase_signal = np.repeat(phase_angles, samples_per_symbol)
    carrier = np.cos(2 * np.pi * fc * t + phase_signal)
    return carrier

def psk_demodulate(received, fc, fs, samples_per_symbol, M):
    k = int(np.log2(M))
    t = np.arange(0, len(received)) / fs
    ref_angles = 2 * np.pi * np.arange(M) / M
    bits_out = []

    for i in range(0, len(received), samples_per_symbol):
        segment = received[i:i+samples_per_symbol]
        if len(segment) < samples_per_symbol:
            break
        t_seg = t[i:i+samples_per_symbol]
        correlations = []

        for ref_angle in ref_angles:
            ref = np.cos(2 * np.pi * fc * t_seg + ref_angle)
            correlations.append(np.sum(segment * ref))

        detected_symbol = np.argmax(correlations)
        detected_bits = [(detected_symbol >> i) & 1 for i in reversed(range(k))]
        bits_out.extend(detected_bits)

    return np.array(bits_out[:len(received) // samples_per_symbol * k])

# Simulação
def simulate_ber(snr_db, M, N, fc, fs, samples_per_bit, num_trials):
    total_errors = 0
    total_bits = 0
    k = int(np.log2(M))
    samples_per_symbol = samples_per_bit * k

    for _ in range(num_trials):
        bits = np.random.randint(0, 2, N)
        bits = bits[:len(bits) - len(bits) % k]  # ajuste p/ múltiplo de log2(M)

        tx_signal = psk_modulate(bits, fc, fs, samples_per_symbol, M)

        signal_power = np.mean(tx_signal**2)
        snr_linear = 10**(snr_db / 10)
        noise_power = signal_power / snr_linear
        noise = np.sqrt(noise_power) * np.random.randn(len(tx_signal))
        rx_signal = tx_signal + noise

        bits_rx = psk_demodulate(rx_signal, fc, fs, samples_per_symbol, M)
        bits = bits[:len(bits_rx)]
        total_errors += np.sum(bits != bits_rx)
        total_bits += len(bits)

    ber_value = total_errors / total_bits
    print(f"[{M}-PSK] SNR = {snr_db:.1f} dB | BER = {ber_value:.6e}")
    return ber_value

# Execução paralela
if __name__ == '__main__':
    schemes = {
        "BPSK": 2,
        "QPSK": 4,
        "8PSK": 8,
        "16PSK": 16,
        "32PSK": 32,
    }

    results = {}
    for name, M in schemes.items():
        print(f"\nSimulando para: {name}")
        with ProcessPoolExecutor(max_workers=min(cpu_count(), 24)) as executor:
            simulate_fn = partial(simulate_ber, M=M, N=N, fc=fc, fs=fs,
                                  samples_per_bit=samples_per_bit, num_trials=num_trials)
            ber = list(executor.map(simulate_fn, snr_range))
            results[name] = ber

    # Plotagem
    plt.figure(figsize=(18, 8))
    for name in schemes:
        plt.plot(snr_range, results[name], 'o-', label=name)

    plt.xlabel("SNR (dB)")
    plt.ylabel("BER")
    plt.yscale("log")
    plt.grid(True, which='both')
    plt.xlim([-5, 15])
    plt.ylim([1e-5, 1])
    plt.legend(loc='upper right', frameon=True)
    plt.tight_layout()
    plt.savefig("curva_ber_psk_multipla.svg", format='svg', dpi=300)
    plt.show()
