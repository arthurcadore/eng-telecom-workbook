import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, lfilter
from concurrent.futures import ProcessPoolExecutor
from functools import partial
import os

# Parâmetros da simulação
fs = 100_000
fc = 10_000
N = 50_000
samples_per_bit = 100
snr_range = np.arange(0, 20, 0.5)
num_trials = 10  # Número de execuções por SNR

def bpsk_modulate(bits, fc, fs, samples_per_bit):
    t = np.arange(0, len(bits) * samples_per_bit) / fs
    bit_signal = np.repeat(2*bits - 1, samples_per_bit)
    carrier = np.cos(2 * np.pi * fc * t)
    return bit_signal * carrier, t

def lowpass_filter(signal, cutoff, fs, order=6):
    b, a = butter(order, cutoff / (0.5 * fs), btype='low')
    return lfilter(b, a, signal)

def bpsk_demodulate(received, fc, fs, samples_per_bit):
    t = np.arange(0, len(received)) / fs
    carrier = np.cos(2 * np.pi * fc * t)
    mixed = received * carrier
    filtered = lowpass_filter(mixed, fc, fs)
    sampled = filtered[samples_per_bit//2::samples_per_bit]
    return (sampled > 0).astype(int)

def simulate_ber(snr_db, N, fc, fs, samples_per_bit, num_trials):
    total_errors = 0
    total_bits = 0

    for _ in range(num_trials):
        bits = np.random.randint(0, 2, N)
        tx_signal, _ = bpsk_modulate(bits, fc, fs, samples_per_bit)

        signal_power = np.mean(tx_signal**2)
        snr_linear = 10**(snr_db / 10)
        noise_power = signal_power / snr_linear
        noise = np.sqrt(noise_power) * np.random.randn(len(tx_signal))

        rx_signal = tx_signal + noise
        bits_rx = bpsk_demodulate(rx_signal, fc, fs, samples_per_bit)

        total_errors += np.sum(bits != bits_rx)
        total_bits += N

    ber_value = total_errors / total_bits
    print(f"SNR = {snr_db:.1f} dB | BER = {ber_value:.10f}")
    return ber_value

# Pool paralelo
if __name__ == '__main__':
    with ProcessPoolExecutor() as executor:
        # Usa partial para fixar parâmetros
        simulate_fn = partial(simulate_ber, N=N, fc=fc, fs=fs, samples_per_bit=samples_per_bit, num_trials=num_trials)
        ber = list(executor.map(simulate_fn, snr_range))

    # Plotagem
    plt.figure(figsize=(10, 6))
    plt.plot(snr_range, ber, 'o-', label="Simulação BPSK (paralelo)")
    plt.xlabel("SNR (dB)")
    plt.ylabel("BER")
    plt.grid(True)
    plt.title("BER vs SNR - BPSK com Multiprocessamento")
    plt.yscale("log")
    plt.legend()
    plt.tight_layout()
    plt.savefig('curva_ber.svg', format='svg', dpi=300)