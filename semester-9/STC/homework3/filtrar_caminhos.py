# Lê todos os caminhos do arquivo original
with open("caminhos.txt", "r") as f:
    linhas = [linha.strip() for linha in f if linha.strip()]

linhas_filtradas = []
cc_vistas = set()

for linha in linhas:
    tokens = linha.split(" - ")
    novas_cc = {t for t in tokens if t.startswith("CC(") and t not in cc_vistas}

    if novas_cc:
        linhas_filtradas.append(linha)
        cc_vistas.update(novas_cc)

# Escreve em novo arquivo
with open("caminhos_filtrados.txt", "w") as f:
    for linha in linhas_filtradas:
        f.write(linha + "\n")

print(f"{len(linhas_filtradas)} caminhos salvos em 'caminhos_filtrados.txt'.")
