import matplotlib.pyplot as plt
import numpy as np
import scienceplots 

plt.style.use("science")
plt.rcParams["figure.figsize"] = (10, 10)
plt.rc("font", size=16)
plt.rc("axes", titlesize=22, labelsize=22)
plt.rc("xtick", labelsize=16)
plt.rc("ytick", labelsize=16)
plt.rc("legend", fontsize=12, frameon=True)
plt.rc("figure", titlesize=22)

# Configuração completa de elétrons por elemento (todas as camadas)
# Cada item: (nível principal, número de elétrons)
elementos = {
    '$Sb$': [(1,2), (2,8), (3,18), (4,18), (5,5)],      # 5s²5p³
    '$I^-$': [(1,2), (2,8), (3,18), (4,18), (5,8)],      # 5s²5p⁶
    '$K^+$': [(1,2), (2,8), (3,8), (4,0)],               # perdeu 1 elétron
    '$S$': [(1,2), (2,8), (3,6)],                        # 3s²3p⁴
}

cor_eletron_valencia = 'skyblue'
cor_eletron_interior = 'gray'
cor_nucleo = 'red'

fig, axes = plt.subplots(2, 2)
axes = axes.flatten()

def plot_orbitais_completos(ax, nivel_eletrons, elemento):
    # Núcleo
    nucleo = ax.plot(0, 0, 'o', color=cor_nucleo, markersize=12, label='Núcleo')[0]
    ax.text(0, 0.2, elemento, ha='center', va='bottom', fontsize=16, fontweight='bold')
    
    # Elétrons por camada
    for i, (nivel, n_eletrons) in enumerate(nivel_eletrons):
        raio = nivel
        cor = cor_eletron_valencia if i == len(nivel_eletrons)-1 else cor_eletron_interior
        
        # Círculo do nível
        circle = plt.Circle((0,0), raio, color='black', fill=False, linestyle='dotted')
        ax.add_artist(circle)
        
        if n_eletrons > 0:
            angles = np.linspace(0, 2*np.pi, n_eletrons, endpoint=False)
            x = raio * np.cos(angles)
            y = raio * np.sin(angles)
            # Diferencia a cor para legenda
            ax.scatter(x, y, s=100, color=cor, edgecolor='black', 
                       label='Elétron de valência' if cor == cor_eletron_valencia else 'Elétron interno')

    ax.set_aspect('equal')
    ax.set_xlim(-10, 10)
    ax.set_ylim(-10, 10)
    ax.set_xticks([])
    ax.set_yticks([])

# Loop pelos elementos
for ax, (el, niveis) in zip(axes, elementos.items()):
    plot_orbitais_completos(ax, niveis, el)
    ax.set_title(rf'{el} - distribuição completa', fontsize=16)
    
    # Legenda sem repetir rótulos
    handles, labels = ax.get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    ax.legend(by_label.values(), by_label.keys(), loc='upper right')

plt.tight_layout()
plt.savefig("distribuicao_completa_legenda.svg")
plt.show()
