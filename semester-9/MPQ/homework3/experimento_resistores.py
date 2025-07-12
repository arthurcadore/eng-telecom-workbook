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

# === INSIRA AQUI OS VALORES MEDIDOS (em ohms) ===
resistores_1k = np.array([1002, 998, 1001, 1003, 997, 1001, 996])  # Exemplo, substitua pelos valores reais
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

media_1k, sigma_1k, erro_medio_1k = analise_estatistica(resistores_1k, '1k$\\Omega$')

# --- DataFrame dos valores medidos ---
df_medidos = pd.DataFrame({
    'Resistores 1k$\\Omega$': resistores_1k,
})
print("\nTabela de valores medidos:")
print(df_medidos)
print("\nCSV dos valores medidos:")
print(df_medidos.to_csv(index=False))

# --- Plot da distribuição normal dos valores medidos ---
def plot_distribuicao(resistores, media, sigma, nome, tipo="normal", filename="plot.svg"):
    import os
    plt.figure(figsize=(16, 9))
    if tipo == "normal":
        if filename == 'plot_hist_1k.svg':
            min_r = np.floor(min(resistores)*2)/2 - 0.5
            max_r = np.ceil(max(resistores)*2)/2 + 0.5
            bins = np.arange(min_r, max_r+0.5, 0.5)
            plt.hist(resistores, bins=bins, density=False, alpha=0.6, label='Valores medidos', color='gray', edgecolor='black')
        else:
            plt.hist(resistores, bins=5, density=False, alpha=0.6, label='Valores medidos', color='gray', edgecolor='black')
        from scipy.stats import norm
        x = np.linspace(min(resistores)-2, max(resistores)+2, 1000)
        y = norm.pdf(x, media, sigma)
        y_scaled = y * len(resistores) * (max(resistores)-min(resistores))/5
        plt.plot(x, y_scaled, label=f'Normal($\mu$={media:.2f}, $\sigma$={sigma:.2f})', color='blue')
        plt.title(f'Distribuição Normal dos Resistores {nome}')
        plt.xlabel('Resistência ($\\Omega$)')
        plt.ylabel('Frequência')
        plt.axvline(media, color='black', linestyle='--', label='Média', linewidth=2    )
        plt.axvline(media + sigma, color='red', linestyle='--', label='+1$\sigma$', linewidth=2)
        plt.axvline(media - sigma, color='red', linestyle='--', label='-1$\sigma$', linewidth=2)
        plt.xlim(min(resistores)-2, max(resistores)+2)
        leg0 = plt.legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True
        )
        leg0.get_frame().set_facecolor('white')
        leg0.get_frame().set_edgecolor('black')
        leg0.get_frame().set_alpha(1.0)

        plt.grid(True)
    elif tipo == "barras":
        unique, counts = np.unique(resistores, return_counts=True)
        plt.bar(unique, counts, width=unique[0]*0.01, color='orange', edgecolor='black', alpha=0.8, label='Contagem')
        plt.title(f'Distribuição dos Resistores {nome}')
        plt.xlabel('Resistência ($\\Omega$)')
        plt.ylabel('Contagem')
        plt.grid(axis='y')
        for i, v in enumerate(counts):
            plt.text(unique[i], v+0.02, str(v), ha='center', va='bottom', fontsize=12)
        leg0 = plt.legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True
        )
        leg0.get_frame().set_facecolor('white')
        leg0.get_frame().set_edgecolor('black')
        leg0.get_frame().set_alpha(1.0)
    os.makedirs("./pictures", exist_ok=True)
    plt.tight_layout()
    plt.savefig(f"./pictures/{filename}", dpi=300)
    plt.close()

plot_distribuicao(resistores_1k, media_1k, sigma_1k, '1k$\\Omega$', tipo='normal', filename='plot_hist_1k.svg')

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
print_resultado("Série 1k$\\Omega$", Req_serie_1k, erro_serie_1k)
print_resultado("Paralelo 1k$\\Omega$", Req_paralelo_1k, erro_paralelo_1k)
print_resultado("Série 1M$\\Omega$", Req_serie_1M, erro_serie_1M)
print_resultado("Paralelo 1M$\\Omega$", Req_paralelo_1M, erro_paralelo_1M)

# --- Tabela resumo das associações ---
dados = {
    'Associação': ['Série 1kΩ', 'Paralelo 1kΩ', 'Série 1MΩ', 'Paralelo 1MΩ'],
    'Req ($\\Omega$)': [Req_serie_1k, Req_paralelo_1k, Req_serie_1M, Req_paralelo_1M],
    'Erro ($\\Omega$)': [erro_serie_1k, erro_paralelo_1k, erro_serie_1M, erro_paralelo_1M]
}
df = pd.DataFrame(dados)

print("\nTabela resumo das associações:")
print(df.to_string(index=False))




# --- Associação mista ---
# Associação: 1k + (1M || 1k) + (1M || 1M) + 1M + (1k || 1k)
# Seleciona resistores (pode ser ajustado conforme os valores reais)
r1k_a = resistores_1k[0]
r1M_a = resistores_1M[0]
r1k_b = resistores_1k[1]
r1M_b = resistores_1M[1]
r1M_c = resistores_1M[2]
r1M_d = resistores_1M[3]
r1k_c = resistores_1k[2]
r1k_d = resistores_1k[3]

# Erros correspondentes
e1k_a = erro_1k[0]
e1M_a = erro_1M[0]
e1k_b = erro_1k[1]
e1M_b = erro_1M[1]
e1M_c = erro_1M[2]
e1M_d = erro_1M[3]
e1k_c = erro_1k[2]
e1k_d = erro_1k[3]

# Etapa 1: (1M_b || 1k_b)
Req_etapa1 = 1 / (1/r1M_b + 1/r1k_b)
erro_etapa1 = (Req_etapa1**2) * sqrt((e1M_b/r1M_b**2)**2 + (e1k_b/r1k_b**2)**2)

# Etapa 2: [Etapa 1] + (1M_c || 1M_d)
Req_paralelo_1M = 1 / (1/r1M_c + 1/r1M_d)
erro_paralelo_1M = (Req_paralelo_1M**2) * sqrt((e1M_c/r1M_c**2)**2 + (e1M_d/r1M_d**2)**2)
Req_etapa2 = Req_etapa1 + Req_paralelo_1M
erro_etapa2 = erro_etapa1 + erro_paralelo_1M

# Etapa 3: [Etapa 2] + 1M_a
Req_etapa3 = Req_etapa2 + r1M_a
erro_etapa3 = erro_etapa2 + e1M_a

# Etapa 4: [Etapa 3] + (1k_c || 1k_d)
Req_paralelo_1k = 1 / (1/r1k_c + 1/r1k_d)
erro_paralelo_1k = (Req_paralelo_1k**2) * sqrt((e1k_c/r1k_c**2)**2 + (e1k_d/r1k_d**2)**2)
Req_etapa4 = Req_etapa3 + Req_paralelo_1k
erro_etapa4 = erro_etapa3 + erro_paralelo_1k

# Etapa 5: 1k_a + [Etapa 4]
Req_etapa5 = r1k_a + Req_etapa4
erro_etapa5 = e1k_a + erro_etapa4

# --- Plot das associações mistas ---
labels = [
    'Etapa 1: (1M || 1k)',
    'Etapa 3: + 1M',
    'Etapa 4: + (1k || 1k)',
    'Etapa 5: + 1k',
    'Etapa 2: + (1M || 1M)'
]
valores = [Req_etapa1, Req_etapa3, Req_etapa4, Req_etapa5, Req_etapa2]
erros = [erro_etapa1, erro_etapa3, erro_etapa4, erro_etapa5, erro_etapa2]

plt.figure(figsize=(16, 9))
cores = ['#4c72b0', '#55a868', '#c44e52', '#8172b3']
barras = plt.bar(labels, valores, yerr=erros, capsize=10, color=cores, edgecolor='black')

for i, barra in enumerate(barras):
    altura = barra.get_height()
    plt.text(barra.get_x() + barra.get_width()/2, altura + max(erros)*0.1, f'{valores[i]:.1f}±{erros[i]:.1f}', 
             ha='center', va='bottom', fontsize=11, color='black')

plt.title('Associação Mista: Evolução da Resistência Equivalente', fontsize=16)
plt.xlabel('Etapas da associação', fontsize=14)
plt.ylabel('Resistência Equivalente ($\\Omega$)', fontsize=14)
plt.xticks(rotation=20)
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()

# Salvar imagem
os.makedirs("./pictures", exist_ok=True)
plt.savefig(f"./pictures/plot_assoc_mista.svg", dpi=300)
plt.close()