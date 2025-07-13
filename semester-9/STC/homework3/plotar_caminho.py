import matplotlib.pyplot as plt

# --- Lê a primeira linha do arquivo ---
with open("caminhos_filtrados.txt", "r") as f:
    linha = f.readline().strip()

# --- Processar tokens: alternam entre nome e distância ---
tokens = linha.split(" - ")

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
            pass  # ignora erros
        i += 1

# --- Plot ---
plt.figure(figsize=(14, 6))
plt.plot(pontos, distancias_acumuladas, marker='o', linestyle='-')
plt.xticks(rotation=90)
plt.xlabel("Ponto")
plt.ylabel("Distância acumulada (km)")
plt.title("Distância acumulada do caminho (POP → última caixa)")
plt.grid(True)
plt.tight_layout()
plt.show()
