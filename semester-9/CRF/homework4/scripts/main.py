import numpy as np
import matplotlib.pyplot as plt
import scienceplots

# Estilo visual
plt.style.use('science')
plt.rcParams["figure.figsize"] = (18, 8 )
plt.rc('font', size=16)
plt.rc('axes', titlesize=22)
plt.rc('axes', labelsize=22)
plt.rc('xtick', labelsize=16)
plt.rc('ytick', labelsize=16)
plt.rc('legend', fontsize=16)
plt.rc('figure', titlesize=22)

class BPSKModem:
    def __init__(self, bit_rate=100, carrier_freq=1000, sample_rate=100000):
        self.bit_rate = bit_rate
        self.carrier_freq = carrier_freq
        self.sample_rate = sample_rate
        self.samples_per_bit = int(sample_rate / bit_rate)

    def generate_bits(self, num_bits):
        return np.random.randint(0, 2, num_bits)

    def modulate(self, bits):
        t = np.arange(0, len(bits) * self.samples_per_bit) / self.sample_rate
        carrier = np.sin(2 * np.pi * self.carrier_freq * t)
        bit_stream = np.repeat(2 * bits - 1, self.samples_per_bit)
        modulated_signal = bit_stream * carrier
        modulated_signal /= np.sqrt(np.mean(modulated_signal**2))  # <- NORMALIZAÇÃO
        return t, modulated_signal, carrier, bit_stream


    def demodulate(self, modulated_signal):
        num_bits = len(modulated_signal) // self.samples_per_bit
        t = np.arange(0, len(modulated_signal)) / self.sample_rate
        carrier = np.sin(2 * np.pi * self.carrier_freq * t)
        mixed = modulated_signal * carrier
        recovered_bits = []

        for i in range(num_bits):
            start = i * self.samples_per_bit
            end = (i + 1) * self.samples_per_bit
            avg = np.mean(mixed[start:end])
            recovered_bits.append(1 if avg > 0 else 0)

        return np.array(recovered_bits)

    def plot_signals(self, t, bits, carrier, modulated):
        fig, axs = plt.subplots(3, 1, figsize=(18, 8), sharex=True)

        # Bits no tempo (expandido)
        bit_stream = np.repeat(bits, self.samples_per_bit)
        axs[0].plot(t, bit_stream, label='Bits (expandidos)', color="red", linewidth=2)
        axs[0].set_ylabel("Bits")
        leg0 = axs[0].legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True)
        leg0.get_frame().set_facecolor('white')
        leg0.get_frame().set_edgecolor('black')
        leg0.get_frame().set_alpha(1.0) # Transparência 
        axs[0].grid()
        axs[0].set_xlim([0, 0.04])

        # Portadora
        axs[1].plot(t, carrier, label='Portadora', color="blue", linewidth=2)
        axs[1].set_ylabel("Amplitude")
        leg1 = axs[1].legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True)
        leg1.get_frame().set_facecolor('white')
        leg1.get_frame().set_edgecolor('black')
        leg1.get_frame().set_alpha(1.0) # Transparência 
        axs[1].grid()
        axs[1].set_xlim([0, 0.04])

        # Sinal Modulado
        axs[2].plot(t, modulated, label='Sinal BPSK', color="green", linewidth=2)
        axs[2].set_xlabel("Tempo [s]")
        axs[2].set_ylabel("Amplitude")
        leg2 = axs[2].legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True)
        leg2.get_frame().set_facecolor('white')
        leg2.get_frame().set_edgecolor('black')
        leg2.get_frame().set_alpha(1.0) # Transparência 
        axs[2].grid()
        axs[2].set_xlim([0, 0.04])

        plt.tight_layout()
        plt.savefig('sinal_bpsk.svg', format='svg', dpi=300)

    def plot_fft(self, t, bits, carrier, modulated):
        # Calcula a FFT para cada sinal
        N = len(t)
        freq = np.fft.fftfreq(N, 1/self.sample_rate)
        
        # FFT dos sinais
        fft_modulante = np.abs(np.fft.fft(bit_stream)) / N
        fft_carrier = np.abs(np.fft.fft(carrier)) / N
        fft_modulated = np.abs(np.fft.fft(modulated)) / N
        
        # Converte para dB (adicionando 1e-10 para evitar log(0))
        fft_modulante_db = 20 * np.log10(np.abs(fft_modulante) + 1e-10)
        fft_carrier_db = 20 * np.log10(np.abs(fft_carrier) + 1e-10)
        fft_modulated_db = 20 * np.log10(np.abs(fft_modulated) + 1e-10)
        
        # Mantém apenas a metade positiva do espectro
        freq = freq[:N//2]
        fft_modulante_db = fft_modulante_db[:N//2]
        fft_carrier_db = fft_carrier_db[:N//2]
        fft_modulated_db = fft_modulated_db[:N//2]
        
        # Plota os espectros
        fig, axs = plt.subplots(3, 1, figsize=(18, 8 ), sharex=True)
        
        # Espectro do sinal modulante
        axs[0].plot(freq, fft_modulante_db, label='Sinal Modulante', color="red", linewidth=2)
        axs[0].set_ylabel("Magnitude [dB]")
        leg0 = axs[0].legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True)
        leg0.get_frame().set_facecolor('white')
        leg0.get_frame().set_edgecolor('black')
        leg0.get_frame().set_alpha(1.0)
        axs[0].grid()
        axs[0].set_xlim([0, 4000])
        axs[0].set_ylim([-200, 0])
        
        # Espectro da portadora
        axs[1].plot(freq, fft_carrier_db, label='Portadora', color="blue", linewidth=2)
        axs[1].set_ylabel("Magnitude [dB]")
        axs[1].set_ylim(bottom=0)  # Define o limite inferior como 0
        leg1 = axs[1].legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True)
        leg1.get_frame().set_facecolor('white')
        leg1.get_frame().set_edgecolor('black')
        leg1.get_frame().set_alpha(1.0)
        axs[1].grid()
        axs[1].set_xlim([0, 4000])
        axs[1].set_ylim([-200, 0])
        
        # Espectro do sinal modulado
        axs[2].plot(freq, fft_modulated_db, label='Sinal Modulado', color="green", linewidth=2)
        axs[2].set_xlabel("Frequência [Hz]")
        axs[2].set_ylabel("Magnitude [dB]")
        axs[2].set_ylim(bottom=0)  # Define o limite inferior como 0
        leg2 = axs[2].legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True)
        leg2.get_frame().set_facecolor('white')
        leg2.get_frame().set_edgecolor('black')
        leg2.get_frame().set_alpha(1.0)
        axs[2].grid()
        axs[2].set_xlim([0, 4000])
        axs[2].set_ylim([-200, 0])
        
        plt.tight_layout()
        plt.savefig('fft_bpsk.svg', format='svg', dpi=300)

if __name__ == "__main__":
    modem = BPSKModem()
    bits = modem.generate_bits(30)

    t, modulated, carrier, bit_stream = modem.modulate(bits)
    recovered_bits = modem.demodulate(modulated)

    print("Bits Originais:  ", bits)
    print("Bits Recuperados:", recovered_bits)
    
    # Plotando os sinais no tempo
    modem.plot_signals(t, bits, carrier, modulated)
    
    # Plotando os espectros de frequência
    modem.plot_fft(t, bits, carrier, modulated)

    modem.plot_signals(t, bits, carrier, modulated)
