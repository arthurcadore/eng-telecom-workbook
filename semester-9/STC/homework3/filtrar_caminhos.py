# Conjunto das caixas desejadas para filtrar as linhas
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

# Lê todos os caminhos do arquivo original
with open("caminhos.txt", "r") as f:
    linhas = [linha.strip() for linha in f if linha.strip()]

linhas_filtradas = []
cc_vistas = set()

for linha in linhas:
    tokens = linha.split(" - ")

    # Verifica se a linha contém alguma das caixas da ultima_caixa
    if not any(caixa in tokens for caixa in ultima_caixa):
        continue  # ignora linhas que não têm nenhuma das caixas

    # Pega os tokens que começam com "CC(" e ainda não foram vistos
    novas_cc = {t for t in tokens if t.startswith("CC(") and t not in cc_vistas}

    if novas_cc:
        linhas_filtradas.append(linha)
        cc_vistas.update(novas_cc)

# Escreve em novo arquivo
with open("caminhos_filtrados.txt", "w") as f:
    for linha in linhas_filtradas:
        f.write(linha + "\n")

print(f"{len(linhas_filtradas)} caminhos salvos em 'caminhos_filtrados.txt'.")
