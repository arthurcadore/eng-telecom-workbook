import matplotlib.pyplot as plt
import numpy as np
import scienceplots 

plt.style.use("science")
plt.rcParams["figure.figsize"] = (16, 9)
plt.rc("font", size=16)
plt.rc("axes", titlesize=22, labelsize=22)
plt.rc("xtick", labelsize=16)
plt.rc("ytick", labelsize=16)
plt.rc("legend", fontsize=12, frameon=True)
plt.rc("figure", titlesize=22)

# Distribuição eletrônica do fósforo: [1s, 2s, 2p, 3s, 3p]
eletrons = [2, 2, 6, 2, 3]
niveles = [1, 2, 2, 3, 3]  # Número do nível principal para o círculo
cores = ['gray', 'gray', 'gray', 'gray', 'skyblue']  # 3p destacado em azul

fig, ax = plt.subplots()

# Ponto central do núcleo
ax.plot(0, 0, 'o', color='red', markersize=12, label='Núcleo')

# Distância de cada camada em unidades arbitrárias
raios = [1, 2, 2, 3, 3]

# Função para colocar elétrons nos círculos
def plot_orbital(raio, n_eletrons, cor):
    angles = np.linspace(0, 2*np.pi, n_eletrons, endpoint=False)
    x = raio * np.cos(angles)
    y = raio * np.sin(angles)
    ax.scatter(x, y, s=100, color=cor, edgecolor='black')

# Plotando cada subnível
for r, e, cor in zip(raios, eletrons, cores):
    # Círculo representando o nível
    circle = plt.Circle((0,0), r, color='black', fill=False, linestyle='dotted')
    ax.add_artist(circle)
    # Elétrons nos orbitais
    plot_orbital(r, e, cor)

# Configurações do gráfico
ax.set_aspect('equal')
ax.set_xlim(-4, 4)
ax.set_ylim(-4, 4)
ax.set_xticks([])
ax.set_yticks([])

# Legenda
ax.scatter([], [], color='skyblue', s=100, edgecolor='black', label='Subnível 3p')
ax.legend(loc='upper right')

#salva a figura como svg
plt.savefig("plot.svg")
