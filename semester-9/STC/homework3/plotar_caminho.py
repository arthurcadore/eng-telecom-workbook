import matplotlib.pyplot as plt

CAMINHO_ARQUIVO = "caminhos.txt"

# Conjuntos das últimas caixas para cada direção
def get_ultima_caixa(direcao):
    if direcao == "cima":
        return {
            "A0021", "B0020", "C0018", "D0016", "E0016", "F0020", "G0016", "H0021"
        }
    elif direcao == "baixo":
        return {
            "P0015", "O0015", "N0025", "M0018", "L0019", "K0018", "J0015", "I0014"
        }
    else:
        return set()

def filtrar_caminhos(ultima_caixa):
    caminhos_validos = []
    with open(CAMINHO_ARQUIVO, "r") as f:
        for linha in f:
            tokens = linha.strip().split(" - ")
            if not tokens:
                continue
            ultima = tokens[-1]
            if any(caixa in ultima for caixa in ultima_caixa):
                caminhos_validos.append(tokens)
    return caminhos_validos

def plotar_caminhos(caminhos_validos, titulo, nome_base):
    plt.figure(figsize=(14, 6))
    for tokens in caminhos_validos:
        pontos = []
        distancias_acumuladas = []
        acumulada = 0.0
        i = 0
        while i < len(tokens):
            nome = tokens[i]
            pontos.append(nome)
            distancias_acumuladas.append(acumulada)
            i += 1
            if i < len(tokens):
                try:
                    dist = float(tokens[i])
                    acumulada += dist
                except ValueError:
                    pass
                i += 1
        plt.plot(pontos, distancias_acumuladas, marker='o', linestyle='-', label=pontos[-1])
    plt.xticks(rotation=90)
    plt.xlabel("Ponto")
    plt.ylabel("Distância acumulada (km)")
    plt.title(titulo)
    plt.grid(True)
    plt.tight_layout()
    leg0 = plt.legend(
            loc='upper left', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True
        )
    leg0.get_frame().set_facecolor('white')
    leg0.get_frame().set_edgecolor('black')
    leg0.get_frame().set_alpha(1.0)
    # Oculta labels que não começam com CC ou CF
    ax = plt.gca()
    xticklabels = ax.get_xticklabels()
    for label in xticklabels:
        texto = label.get_text()
        if not (texto.startswith("CC") or texto.startswith("CF")):
            label.set_visible(False)
    plt.savefig(f"{nome_base}.pdf")
    plt.savefig(f"{nome_base}.svg")
    plt.close()

def main():
    # Caminhos para cima
    cima = get_ultima_caixa("cima")
    caminhos_cima = filtrar_caminhos(cima)
    plotar_caminhos(caminhos_cima, "Distância acumulada dos caminhos (POP → última caixa - CIMA)", "caminho_cima")
    print("Gráficos 'caminho_cima.pdf' e 'caminho_cima.svg' gerados.")

    # Caminhos para baixo
    baixo = get_ultima_caixa("baixo")
    caminhos_baixo = filtrar_caminhos(baixo)
    plotar_caminhos(caminhos_baixo, "Distância acumulada dos caminhos (POP → última caixa - BAIXO)", "caminho_baixo")
    print("Gráficos 'caminho_baixo.pdf' e 'caminho_baixo.svg' gerados.")

if __name__ == "__main__":
    main()
