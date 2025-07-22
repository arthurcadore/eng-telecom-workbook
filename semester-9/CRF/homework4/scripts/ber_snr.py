import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, lfilter
from concurrent.futures import ProcessPoolExecutor
from functools import partial
from multiprocessing import cpu_count
import scienceplots

# Estilo
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
N = 1_000  # reduzido para acelerar simulação
samples_per_bit = 100
snr_range = np.arange(-5, 15, 0.5)  # Inclui SNR negativos e aumenta o intervalo
num_trials = 5

# Filtro passa-baixas
def lowpass_filter(signal, cutoff, fs, order=6):
    from scipy.signal import butter, lfilter
    b, a = butter(order, cutoff / (0.5 * fs), btype='low')
    return lfilter(b, a, signal)

# ---------------- BPSK ----------------
def bpsk_modulate(bits, fc, fs, samples_per_bit):
    t = np.arange(0, len(bits) * samples_per_bit) / fs
    bit_signal = np.repeat(2*bits - 1, samples_per_bit)
    carrier = np.cos(2 * np.pi * fc * t)
    return bit_signal * carrier

def bpsk_demodulate(received, fc, fs, samples_per_bit):
    t = np.arange(0, len(received)) / fs
    carrier = np.cos(2 * np.pi * fc * t)
    mixed = received * carrier
    filtered = lowpass_filter(mixed, fc, fs)
    sampled = filtered[samples_per_bit//2::samples_per_bit]
    return (sampled > 0).astype(int)

# ---------------- ASK ----------------
def ask_modulate(bits, fc, fs, samples_per_bit):
    t = np.arange(0, len(bits) * samples_per_bit) / fs
    bit_signal = np.repeat(bits, samples_per_bit)
    carrier = np.cos(2 * np.pi * fc * t)
    return bit_signal * carrier

def ask_demodulate(received, fc, fs, samples_per_bit):
    t = np.arange(0, len(received)) / fs
    carrier = np.cos(2 * np.pi * fc * t)
    mixed = received * carrier
    filtered = lowpass_filter(mixed, fc, fs)
    sampled = filtered[samples_per_bit//2::samples_per_bit]
    return (sampled > np.max(sampled)/2).astype(int)

# ---------------- FSK ----------------
def fsk_modulate(bits, fc, fs, samples_per_bit, delta_f=2000):
    t = np.arange(0, len(bits) * samples_per_bit) / fs
    freqs = np.where(bits == 0, fc - delta_f, fc + delta_f)
    freq_signal = np.repeat(freqs, samples_per_bit)
    return np.cos(2 * np.pi * freq_signal * t)

def fsk_demodulate(received, fc, fs, samples_per_bit, delta_f=2000):
    t = np.arange(0, len(received)) / fs
    carrier0 = np.cos(2 * np.pi * (fc - delta_f) * t)
    carrier1 = np.cos(2 * np.pi * (fc + delta_f) * t)

    mixed0 = lowpass_filter(received * carrier0, fc, fs)
    mixed1 = lowpass_filter(received * carrier1, fc, fs)

    s0 = mixed0[samples_per_bit//2::samples_per_bit]
    s1 = mixed1[samples_per_bit//2::samples_per_bit]

    return (s1 > s0).astype(int)

# ---------------- Simulação ----------------
def simulate_ber(snr_db, scheme, N, fc, fs, samples_per_bit, num_trials):
    total_errors = 0
    total_bits = 0

    for _ in range(num_trials):
        bits = np.random.randint(0, 2, N)

        if scheme == 'BPSK':
            tx_signal = bpsk_modulate(bits, fc, fs, samples_per_bit)
        elif scheme == 'ASK':
            tx_signal = ask_modulate(bits, fc, fs, samples_per_bit)
        elif scheme == 'FSK':
            tx_signal = fsk_modulate(bits, fc, fs, samples_per_bit)
        else:
            raise ValueError("Esquema desconhecido")

        signal_power = np.mean(tx_signal**2)
        snr_linear = 10**(snr_db / 10)
        noise_power = signal_power / snr_linear
        noise = np.sqrt(noise_power) * np.random.randn(len(tx_signal))
        rx_signal = tx_signal + noise

        if scheme == 'BPSK':
            bits_rx = bpsk_demodulate(rx_signal, fc, fs, samples_per_bit)
        elif scheme == 'ASK':
            bits_rx = ask_demodulate(rx_signal, fc, fs, samples_per_bit)
        elif scheme == 'FSK':
            bits_rx = fsk_demodulate(rx_signal, fc, fs, samples_per_bit)
        
        total_errors += np.sum(bits != bits_rx)
        total_bits += N

    ber_value = total_errors / total_bits
    print(f"[{scheme}] SNR = {snr_db:.1f} dB | BER = {ber_value:.6e}")
    return ber_value

# ---------------- Execução Paralela ----------------
if __name__ == '__main__':
    schemes = ['BPSK', 'ASK', 'FSK']
    results = {}

    for scheme in schemes:
        print(f"\nSimulando para: {scheme}")
        with ProcessPoolExecutor(max_workers=min(cpu_count(), 24)) as executor:
            simulate_fn = partial(simulate_ber, scheme=scheme, N=N, fc=fc, fs=fs,
                                  samples_per_bit=samples_per_bit, num_trials=num_trials)
            ber = list(executor.map(simulate_fn, snr_range))
            results[scheme] = ber

    # ---------------- Plotagem ----------------
    plt.figure(figsize=(18, 8))
    for scheme in schemes:
        plt.plot(snr_range, results[scheme], 'o-', label=f"{scheme}")

    plt.xlabel("SNR (dB)")
    plt.ylabel("BER")
    plt.yscale("log")
    plt.grid(True, which='both')  # Adiciona grid para ambos os eixos
    plt.grid(True, which='minor', linestyle=':', linewidth=0.5)  # Adiciona grid menor pontilhado
    plt.grid(True, which='major', linestyle='-', linewidth=0.75)  # Adiciona grid maior sólido
    plt.xlim([-5, 15])
    plt.ylim([1e-5, 1])
    plt.tight_layout()
    
    # Adiciona legenda com pontos
    leg1 = plt.legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True)
    leg1.get_frame().set_facecolor('white')
    leg1.get_frame().set_edgecolor('black')
    leg1.get_frame().set_alpha(1.0)
    
    plt.savefig("curva_ber_comparativa.svg", format='svg', dpi=300)
    plt.show()
