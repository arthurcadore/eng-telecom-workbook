import matplotlib.pyplot as plt

# Defina o caminho para o arquivo
CAMINHO_ARQUIVO = "caminhos.txt"

# Conjunto das últimas caixas que queremos plotar
ultima_caixa = {
    "A0021", 
    "B0020", 
    "C0018", 
    "D0016", 
    "E0016", 
    "F0020", 
    "G0016", 
    "H0021"
}

# --- Lê e filtra caminhos que terminam em uma das últimas caixas ---
caminhos_validos = []

with open(CAMINHO_ARQUIVO, "r") as f:
    for linha in f:
        tokens = linha.strip().split(" - ")
        if not tokens:
            continue
        ultima = tokens[-1]
        if any(caixa in ultima for caixa in ultima_caixa):
            caminhos_validos.append(tokens)

# --- Plot dos caminhos ---
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

    # Último ponto será usado como rótulo da linha
    plt.plot(pontos, distancias_acumuladas, marker='o', linestyle='-', label=pontos[-1])

# --- Configurações do gráfico ---
plt.xticks(rotation=90)
plt.xlabel("Ponto")
plt.ylabel("Distância acumulada (km)")
plt.title("Distância acumulada dos caminhos (POP → última caixa)")
plt.grid(True)
plt.tight_layout()
plt.legend(title="Última Caixa", bbox_to_anchor=(1.05, 1), loc='upper left')

# --- Oculta labels que não começam com CC ou CF ---
ax = plt.gca()
xticks = ax.get_xticks()
xticklabels = ax.get_xticklabels()
for label in xticklabels:
    texto = label.get_text()
    if not (texto.startswith("CC") or texto.startswith("CF")):
        label.set_visible(False)

# --- Mostrar gráfico ---
plt.show()