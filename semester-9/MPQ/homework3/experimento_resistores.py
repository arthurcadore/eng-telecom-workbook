import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from math import sqrt
from itertools import combinations

# === INSIRA AQUI OS VALORES MEDIDOS (em ohms) ===
resistores_1k = np.array([1002, 998, 1001, 1003, 997])  # Exemplo, substitua pelos valores reais
resistores_1M = np.array([1005000, 999000, 1001000, 1002000, 999500])  # Exemplo

# Erro relativo de 0,01%
erro_relativo = 0.0001

# Erro absoluto de cada resistor
# Fórmula: \( \Delta R_i = R_i \cdot \delta \), onde \( \delta = 0,0001 \)
erro_1k = resistores_1k * erro_relativo
erro_1M = resistores_1M * erro_relativo

# --- Análise estatística dos valores medidos ---
def analise_estatistica(resistores, nome):
    # Média: \( \overline{R} = \frac{1}{n} \sum_{i=1}^n R_i \)
    # Desvio padrão: \( \sigma = \sqrt{\frac{\sum (R_i - \overline{R})^2}{n-1}} \)
    # Erro médio: \( \Delta \overline{R} = \frac{\sigma}{\sqrt{n}} \)
    print(f"\n--- Estatística dos resistores {nome} ---")
    media = np.mean(resistores)
    desvio_padrao = np.std(resistores, ddof=1)
    erro_medio = desvio_padrao / np.sqrt(len(resistores))
    print(f"Média: {media:.4f} Ω")
    print(f"Desvio padrão: {desvio_padrao:.4f} Ω")
    print(f"Erro médio: {erro_medio:.4f} Ω")
    return media, desvio_padrao, erro_medio

media_1k, sigma_1k, erro_medio_1k = analise_estatistica(resistores_1k, '1kΩ')
media_1M, sigma_1M, erro_medio_1M = analise_estatistica(resistores_1M, '1MΩ')

# --- DataFrame dos valores medidos ---
df_medidos = pd.DataFrame({
    'Resistores 1kΩ': resistores_1k,
    'Resistores 1MΩ': resistores_1M
})
print("\nTabela de valores medidos:")
print(df_medidos)
print("\nCSV dos valores medidos:")
print(df_medidos.to_csv(index=False))

# --- Plot da distribuição normal dos valores medidos ---
def plot_distribuicao(resistores, media, sigma, nome):
    # Distribuição normal: \( f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{1}{2} \left(\frac{x-\mu}{\sigma}\right)^2} \)
    from scipy.stats import norm
    x = np.linspace(media - 4*sigma, media + 4*sigma, 1000)
    y = norm.pdf(x, media, sigma)
    plt.figure(figsize=(16, 9))
    # plt.hist(resistores, bins=5, density=True, alpha=0.5, label='Valores medidos')
    plt.plot(x, y, label=f'Normal(μ={media:.2f}, σ={sigma:.2f})', color='blue')
    plt.title(f'Distribuição Normal dos Resistores {nome}')
    plt.xlabel('Resistência (Ω)')
    plt.ylabel('Densidade de Probabilidade')
    plt.axvline(media, color='black', linestyle='--', label='Média')
    plt.axvline(media + sigma, color='red', linestyle='--', label='+1σ')
    plt.axvline(media - sigma, color='red', linestyle='--', label='-1σ')
    plt.legend()
    plt.grid(True)
    plt.show()

plot_distribuicao(resistores_1k, media_1k, sigma_1k, '1kΩ')
plot_distribuicao(resistores_1M, media_1M, sigma_1M, '1MΩ')

# --- Associação em série ---
# Resistência equivalente em série: \( R_{eq,s} = \sum_{i=1}^n R_i \)
# Erro absoluto em série: \( \Delta R_{eq,s} = \sum_{i=1}^n \Delta R_i \)
Req_serie_1k = np.sum(resistores_1k)
Req_serie_1M = np.sum(resistores_1M)
erro_serie_1k = np.sum(erro_1k)
erro_serie_1M = np.sum(erro_1M)

# --- Associação em paralelo ---
# Resistência equivalente em paralelo: \( R_{eq,p} = \left( \sum_{i=1}^n \frac{1}{R_i} \right)^{-1} \)
# Propagação de erro (aproximação):
# \( \Delta R_{eq,p} = R_{eq,p}^2 \sqrt{ \sum_{i=1}^n \left( \frac{\Delta R_i}{R_i^2} \right)^2 } \)
def resistencia_paralelo(resistores):
    return 1 / np.sum(1 / resistores)

def erro_paralelo(resistores, erros):
    Req = resistencia_paralelo(resistores)
    parcial = (Req**2) * np.sum((erros / resistores**2)**2)
    return sqrt(parcial)

Req_paralelo_1k = resistencia_paralelo(resistores_1k)
Req_paralelo_1M = resistencia_paralelo(resistores_1M)
erro_paralelo_1k = erro_paralelo(resistores_1k, erro_1k)
erro_paralelo_1M = erro_paralelo(resistores_1M, erro_1M)

# --- Exibição dos resultados das associações ---
def print_resultado(nome, Req, erro):
    print(f"{nome}: {Req:.4f} Ω ± {erro:.4f} Ω")

print("\n=== Resultados das Associações ===")
print_resultado("Série 1kΩ", Req_serie_1k, erro_serie_1k)
print_resultado("Paralelo 1kΩ", Req_paralelo_1k, erro_paralelo_1k)
print_resultado("Série 1MΩ", Req_serie_1M, erro_serie_1M)
print_resultado("Paralelo 1MΩ", Req_paralelo_1M, erro_paralelo_1M)

# --- Tabela resumo das associações ---
dados = {
    'Associação': ['Série 1kΩ', 'Paralelo 1kΩ', 'Série 1MΩ', 'Paralelo 1MΩ'],
    'Req (Ω)': [Req_serie_1k, Req_paralelo_1k, Req_serie_1M, Req_paralelo_1M],
    'Erro (Ω)': [erro_serie_1k, erro_paralelo_1k, erro_serie_1M, erro_paralelo_1M]
}
df = pd.DataFrame(dados)

print("\nTabela resumo das associações:")
print(df.to_string(index=False))




# --- Associação mista ---
# Exemplo 1: 1k + (1M || 1k) + 1M
# Seleciona resistores (pode ser ajustado conforme os valores reais)
r1k_a = resistores_1k[0]
r1M_a = resistores_1M[0]
r1k_b = resistores_1k[1]
r1M_b = resistores_1M[1]

# Erros correspondentes
e1k_a = erro_1k[0]
e1M_a = erro_1M[0]
e1k_b = erro_1k[1]
e1M_b = erro_1M[1]

# Etapa 1: (1M_b || 1k_b)
Req_paralelo_misto1 = 1 / (1/r1M_b + 1/r1k_b)
erro_paralelo_misto1 = (Req_paralelo_misto1**2) * sqrt((e1M_b/r1M_b**2)**2 + (e1k_b/r1k_b**2)**2)

# Etapa 2: r1k_a + Req_paralelo_misto1
Req_misto2 = r1k_a + Req_paralelo_misto1
erro_misto2 = e1k_a + erro_paralelo_misto1

# Etapa 3: Req_misto2 + r1M_a
Req_misto3 = Req_misto2 + r1M_a
erro_misto3 = erro_misto2 + e1M_a

# Exemplo 2: (1k || 1k) + (1M || 1M)
Req_paralelo_1k = 1 / (1/resistores_1k[2] + 1/resistores_1k[3])
erro_paralelo_1k = (Req_paralelo_1k**2) * sqrt((erro_1k[2]/resistores_1k[2]**2)**2 + (erro_1k[3]/resistores_1k[3]**2)**2)

Req_paralelo_1M = 1 / (1/resistores_1M[2] + 1/resistores_1M[3])
erro_paralelo_1M = (Req_paralelo_1M**2) * sqrt((erro_1M[2]/resistores_1M[2]**2)**2 + (erro_1M[3]/resistores_1M[3]**2)**2)

Req_misto4 = Req_paralelo_1k + Req_paralelo_1M
erro_misto4 = erro_paralelo_1k + erro_paralelo_1M

# --- Plot das associações mistas ---
labels = [
    'Etapa 1: (1M || 1k)',
    'Etapa 2: 1k + (1M || 1k)',
    'Etapa 3: 1k + (1M || 1k) + 1M',
    'Etapa 4: (1k || 1k) + (1M || 1M)'
]
valores = [Req_paralelo_misto1, Req_misto2, Req_misto3, Req_misto4]
erros = [erro_paralelo_misto1, erro_misto2, erro_misto3, erro_misto4]

plt.figure(figsize=(16, 9))
plt.scatter(range(len(valores)), valores, color='purple')
for i, (x, y, e) in enumerate(zip(range(len(valores)), valores, erros)):
    plt.text(x, y, f"{y:.1f}±{e:.1f}", fontsize=9, ha='left', va='bottom', color='purple')
plt.xticks(range(len(labels)), labels, rotation=20)
plt.title('Associação Mista: Evolução da Resistência Equivalente')
plt.xlabel('Estágio da associação')
plt.ylabel('Resistência equivalente (Ω)')
plt.grid(True)
plt.tight_layout()
plt.show()

# --- Simulação de resposta a sinal senoidal (5V, 1kHz) ---
# Parâmetros do sinal
V_in = 5  # Volts (amplitude)
freq = 1000  # Hz
omega = 2 * np.pi * freq
T = 1 / freq

t = np.linspace(0, 3*T, 1000)  # 3 períodos
vin = V_in * np.sin(omega * t)

# Exemplo: saída sobre o resistor de 1k em série na associação mista 1k + (1M || 1k) + 1M
# Usando Req_misto3 como resistência total, e r1k_a como resistência de interesse
V_out = vin * (r1k_a / Req_misto3)

# Fator de amplificação para visualização
fator_saida = 80

plt.figure(figsize=(16, 9))
plt.plot(t * 1e3, vin, label='Sinal de entrada (5V, 1kHz)', color='blue')
plt.plot(t * 1e3, V_out * fator_saida, label=f'Sinal de saída (sobre 1kΩ em série) ×{fator_saida}', color='orange')
plt.title('Resposta do circuito resistivo a um sinal senoidal')
plt.xlabel('Tempo (ms)')
plt.ylabel('Tensão (V)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# --- Efeito Joule: aquecimento de água com resistor (modelo realista com lei de Newton) ---
# Dados do problema
P = 1000  # Potência do resistor (W)
V = 220   # Tensão (V)
m_agua = 0.5  # massa da água (kg)
c_agua = 4186  # calor específico da água (J/kg°C)
T0 = 20  # Temperatura inicial (°C)
T_amb = 20  # Temperatura ambiente (°C)
k = 0.008  # coeficiente de troca térmica (1/s), ajuste conforme experimento

tempo_total = 300  # tempo total de simulação (s)
dt = 5  # passo de tempo (s)
tempos = np.arange(0, tempo_total + dt, dt)

# Fórmulas utilizadas:
# Lei de Newton para aquecimento:
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
# Gera dados teóricos simulando um aquecimento exponencial (ajuste conforme desejado)
T0_fict = 20
Tmax_fict = 80
k_fict = 0.025

temperaturas_teorico = T0_fict + (Tmax_fict - T0_fict) * (1 - np.exp(-k_fict * tempos_fict))

# Vetor de dados fictícios de temperatura medida (exemplo com ruído)
np.random.seed(42)
temperatura_medida = temperaturas_teorico + np.random.normal(0, 0.5, size=n_fict)

# Incerteza propagada: erro de 0.5°C em cada medição
incerteza_medida = np.full_like(temperatura_medida, 0.5)

# Plot dos dados teóricos e medidos com barras de erro
plt.figure(figsize=(16, 9))
plt.plot(tempos_fict, temperaturas_teorico, label='Teórico (modelo exponencial)', color='red', marker='o')
plt.errorbar(tempos_fict, temperatura_medida, yerr=incerteza_medida, fmt='x', color='blue', label='Medido (fictício) ±0.5°C')
plt.title('Temperatura da água (teórico vs. medido, 0.5L, 1000W)')
plt.xlabel('Tempo (s)')
plt.ylabel('Temperatura (°C)')
plt.xlim(0, 180)
plt.ylim(T0_fict-2, Tmax_fict+5)
plt.legend()
plt.grid(True)
# Exibe valor da incerteza no gráfico
plt.text(5, Tmax_fict, 'Incerteza propagada: ±0.5°C', fontsize=12, color='blue')
plt.tight_layout()
plt.show()