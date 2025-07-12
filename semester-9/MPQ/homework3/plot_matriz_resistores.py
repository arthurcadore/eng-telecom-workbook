import numpy as np
import matplotlib.pyplot as plt
import os
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


# Vetores de resistores
resistores_e12 = np.array([100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820])
resistores_e24 = np.array([
    100, 110, 120, 130, 150, 160, 180, 200, 220, 240, 270, 300,
    330, 360, 390, 430, 470, 510, 560, 620, 680, 750, 820, 910
])

# Funções para matriz de associações

def matriz_serie(resistores):
    return resistores[:, None] + resistores[None, :]

def matriz_paralelo(resistores):
    return 1 / (1/resistores[:, None] + 1/resistores[None, :])

os.makedirs("./pictures", exist_ok=True)

# Matriz série (resistores nas linhas, resistores nas colunas)
matriz_s = resistores_e12[:, None] + resistores_e12[None, :]

plt.figure(figsize=(16, 9))
plt.imshow(matriz_s, cmap='viridis', origin='lower')
plt.colorbar(label=r'R_{eq} série ($\Omega$)')
plt.title(r'Matriz de $R_{eq}$ em Série (E12)')
plt.xlabel(r'Resistores série E12 ($\Omega$)')
plt.ylabel(r'Resistores série E12 ($\Omega$)')
plt.xticks(range(len(resistores_e12)), resistores_e12)
plt.yticks(range(len(resistores_e12)), resistores_e12)
for i in range(len(resistores_e12)):
    for j in range(len(resistores_e12)):
        plt.text(j, i, f'{matriz_s[i, j]:.0f}', ha='center', va='center', color='white', fontsize=8)
plt.tight_layout()
plt.savefig('./pictures/matriz_serie_e12.svg', dpi=300)
plt.close()

# Matriz paralelo (resistores nas linhas, resistores nas colunas)
matriz_p = 1 / (1/resistores_e12[:, None] + 1/resistores_e12[None, :])

plt.figure(figsize=(16, 9))
plt.imshow(matriz_p, cmap='plasma', origin='lower')
plt.colorbar(label=r'R_{eq} paralelo ($\Omega$)')
plt.title(r'Matriz de $R_{eq}$ em Paralelo (E12)')
plt.xlabel(r'Resistores paralelo E12 ($\Omega$)')
plt.ylabel(r'Resistores paralelo E12 ($\Omega$)')
plt.xticks(range(len(resistores_e12)), resistores_e12)
plt.yticks(range(len(resistores_e12)), resistores_e12)
for i in range(len(resistores_e12)):
    for j in range(len(resistores_e12)):
        plt.text(j, i, f'{matriz_p[i, j]:.1f}', ha='center', va='center', color='white', fontsize=8)
plt.tight_layout()
plt.savefig('./pictures/matriz_paralelo_e12.svg', dpi=300)
plt.close()

# Matriz série (E24)
matriz_s_e24 = resistores_e24[:, None] + resistores_e24[None, :]
plt.figure(figsize=(16, 9))
plt.imshow(matriz_s_e24, cmap='viridis', origin='lower')
plt.colorbar(label=r'R_{eq} série ($\Omega$)')
plt.title(r'Matriz de $R_{eq}$ em Série (E24)')
plt.xlabel(r'Resistores série E24 ($\Omega$)')
plt.ylabel(r'Resistores série E24 ($\Omega$)')
plt.xticks(range(len(resistores_e24)), resistores_e24, rotation=90)
plt.yticks(range(len(resistores_e24)), resistores_e24)
for i in range(len(resistores_e24)):
    for j in range(len(resistores_e24)):
        plt.text(j, i, f'{matriz_s_e24[i, j]:.0f}', ha='center', va='center', color='white', fontsize=6)
plt.tight_layout()
plt.savefig('./pictures/matriz_serie_e24.svg', dpi=300)
plt.close()

# Matriz paralelo (E24)
matriz_p_e24 = 1 / (1/resistores_e24[:, None] + 1/resistores_e24[None, :])
plt.figure(figsize=(16, 9))
plt.imshow(matriz_p_e24, cmap='plasma', origin='lower')
plt.colorbar(label=r'R_{eq} paralelo ($\Omega$)')
plt.title(r'Matriz de $R_{eq}$ em Paralelo (E24)')
plt.xlabel(r'Resistores paralelo E24 ($\Omega$)')
plt.ylabel(r'Resistores paralelo E24 ($\Omega$)')
plt.xticks(range(len(resistores_e24)), resistores_e24, rotation=90)
plt.yticks(range(len(resistores_e24)), resistores_e24)
for i in range(len(resistores_e24)):
    for j in range(len(resistores_e24)):
        plt.text(j, i, f'{matriz_p_e24[i, j]:.1f}', ha='center', va='center', color='white', fontsize=6)
plt.tight_layout()
plt.savefig('./pictures/matriz_paralelo_e24.svg', dpi=300)
plt.close()


