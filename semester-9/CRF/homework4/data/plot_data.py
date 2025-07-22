import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scienceplots

# Estilo visual
plt.style.use('science')
plt.rcParams["figure.figsize"] = (16, 9)
plt.rc('font', size=16)
plt.rc('axes', titlesize=22)
plt.rc('axes', labelsize=22)
plt.rc('xtick', labelsize=16)
plt.rc('ytick', labelsize=16)
plt.rc('legend', fontsize=16)
plt.rc('figure', titlesize=22)

# Carrega o arquivo
df = pd.read_csv("data.txt", sep="\t")

# Extrai sinais
t = df["time"]
modulado = df["V(bpsksignal)"]
portadora = df["V(carriersignal)"]
demodulado = df["V(demodedsignal)"]
injetada = df["V(injectedcarrier)"]
modulante = df["V(modulatingsignal)"]


# --- PLOT 1: Transmissor ---
plt.figure(figsize=(16, 9))
plt.subplot(3, 1, 1)
plt.plot(t, modulante, label="Sinal Modulante", color="red", linewidth=2)
plt.title("Sinal Modulante")
plt.ylabel("Amplitude")

plt.subplot(3, 1, 2)
plt.plot(t, portadora, label="Portadora", color="blue", linewidth=2)
plt.title("Portadora")
plt.ylabel("Amplitude")

plt.subplot(3, 1, 3)
plt.plot(t, modulado, label="Sinal Modulado", color="green", linewidth=2)
plt.title("Sinal Modulado BPSK")
plt.xlabel("Tempo [s]")
plt.ylabel("Amplitude")
plt.legend()

plt.tight_layout()
plt.savefig('plot_transmissor.svg', format='svg', dpi=300)

# --- PLOT 2: Receptor ---
plt.figure(figsize=(16, 9))
plt.subplot(3, 1, 1)
plt.plot(t, modulado, label="Sinal Modulado", color="green", linewidth=2)
plt.title("Sinal Modulado BPSK")
plt.xlabel("Tempo [s]")
plt.ylabel("Amplitude")

plt.subplot(3, 1, 2)
plt.plot(t, injetada, label="Portadora Injetada", color="blue", linewidth=2)
plt.title("Portadora Injetada")
plt.ylabel("Amplitude")

plt.subplot(3, 1, 3)
plt.plot(t, demodulado, label="Sinal Demodulado", color="red", linewidth=2)
plt.title("Sinal Demodulado")
plt.xlabel("Tempo [s]")
plt.ylabel("Amplitude")

plt.tight_layout()
plt.savefig('plot_receptor.svg', format='svg', dpi=300)

# --- PLOT 3: Transmissor VS receptor: 
plt.figure(figsize=(16, 9))
plt.subplot(2, 1, 1)
plt.plot(t, modulado, label="Sinal Modulado", color="green", linewidth=2)
plt.title("Sinal Modulado BPSK")
plt.xlabel("Tempo [s]")
plt.ylabel("Amplitude")

# plota o sinal modulante e o sinal demodulado
plt.subplot(2, 1, 2)
plt.plot(t, modulante, label="Sinal Modulante", color="blue", linewidth=2)
plt.plot(t, demodulado, label="Sinal Demodulado", color="red", linewidth=2)
plt.title("Sinal Modulante e Demodulado")
plt.xlabel("Tempo [s]")
plt.ylabel("Amplitude")
leg0 = plt.legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True
    )
leg0.get_frame().set_facecolor('white')
leg0.get_frame().set_edgecolor('black')
leg0.get_frame().set_alpha(1.0) # Transparência


plt.tight_layout()
plt.savefig('plot_comparacao.svg', format='svg', dpi=300)
