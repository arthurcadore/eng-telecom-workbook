import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from math import sqrt
import os
from itertools import combinations
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

# --- Efeito Joule: aquecimento de água com resistor (modelo realista com lei de Newton) ---
# Dados do problema
P = 1000  # Potência do resistor (W)
V = 220   # Tensão (V)
m_agua = 0.5  # massa da água (kg)
c_agua = 4186  # calor específico da água (J/kg°C)
T0 = 20  # Temperatura inicial (°C)
T_amb = 20  # Temperatura ambiente (°C)

tempo_total = 300  # tempo total de simulação (s)
dt = 5  # passo de tempo (s)
tempos = np.arange(0, tempo_total + dt, dt)
k = 0.001

# Fórmulas utilizadas:
# Lei de Newton para aquecimento:c
#   \[
#   \frac{dT}{dt} = \frac{P}{m c} - k (T - T_{amb})
#   \]
# Solução discreta para cada passo de tempo dt:
#   \[
#   T_{i+1} = T_i + \left( \frac{P}{m c} - k (T_i - T_{amb}) \right) dt
#   \]

temperaturas = [T0]
for i in range(1, len(tempos)):
    T_atual = temperaturas[-1]
    # Lei de Newton: dT/dt = (P/(m*c)) - k*(T - T_amb)
    dT = (P/(m_agua*c_agua) - k*(T_atual - T_amb)) * dt
    temperaturas.append(T_atual + dT)

temperaturas = np.array(temperaturas)

# Vetor para valores práticos (preencha após experimento)
temperaturas_praticas = np.full_like(temperaturas, np.nan, dtype=float)  # substitua np.nan pelos valores reais

# --- Vetor de dados fictícios para 36 amostras (5 em 5 segundos, até 180s) ---
dt_fict = 5
n_fict = 36

tempos_fict = np.arange(0, n_fict * dt_fict, dt_fict)
T0_fict = 20

# Fator multiplicador para ajuste da inclinação da reta teórica
k_linear = 0.8 # ajuste conforme necessário

# Modelo linear ajustável: ΔT = k_linear * Q/(m*c) acumulativo
# Q acumulado até cada tempo: Q = P * t
# T = T0 + k_linear * Q/(m*c)
temperaturas_teorico = T0_fict + k_linear * (P * tempos_fict) / (m_agua * c_agua)

# Vetores de dados fictícios de temperatura medida
temperatura_medida1 = np.array([15, 18, 20, 26, 27, 28, 32, 34, 35, 37, 40, 42, 44, 45, 48, 49, 51, 53, 55, 56, 58, 60, 61, 64, 65, 66, 69, 71, 73, 74, 75, 78, 80, 82, 83, 85])
temperatura_medida2 = temperatura_medida1 - np.random.normal(1, 0.7, n_fict)  # um pouco abaixo
temperatura_medida3 = temperatura_medida1 + np.random.normal(1, 0.7, n_fict)  # um pouco acima

# Incerteza propagada: erro de 0.5°C em cada medição
incerteza_medida = np.full_like(temperatura_medida1, 0.5)

# Plot dos dados teóricos e medidos com barras de erro
plt.figure(figsize=(16, 9))
plt.plot(tempos_fict, temperaturas_teorico, label=f'Teórico (modelo linear, k={k_linear})', color='red', marker='o', linewidth=2)
plt.errorbar(tempos_fict, temperatura_medida1, yerr=incerteza_medida, fmt='x', color='blue', label='Medida 1 ±0.5°C')
plt.errorbar(tempos_fict, temperatura_medida2, yerr=incerteza_medida, fmt='x', color='green', label='Medida 2 ±0.5°C')
plt.errorbar(tempos_fict, temperatura_medida3, yerr=incerteza_medida, fmt='x', color='orange', label='Medida 3 ±0.5°C')
plt.title('Temperatura da água (teórico vs. 3 medidas, 0.5L, 1000W)')
plt.xlabel('Tempo (s)')
plt.ylabel('Temperatura (°C)')
plt.xlim(0, 180)
plt.ylim(T0_fict-2, max(temperatura_medida3)+5)
plt.legend()
leg0 = plt.legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True
        )
leg0.get_frame().set_facecolor('white')
leg0.get_frame().set_edgecolor('black')
leg0.get_frame().set_alpha(1.0)
plt.gca().set_xticks(np.arange(0, 181, 5))
plt.minorticks_off()
plt.grid(True, axis='both')
plt.tight_layout()
import os
# Garante que o diretório ./pictures/ existe
os.makedirs("./pictures", exist_ok=True)

# Salva o gráfico atual com nome descritivo
plt.savefig(f"./pictures/plot_temperatura.svg", dpi=300)
plt.close()