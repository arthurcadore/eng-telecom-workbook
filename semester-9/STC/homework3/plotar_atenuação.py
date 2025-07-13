import os
import matplotlib.pyplot as plt
DB_PER_KM = 0.2         # Atenuação fibra dB/km
CF_ATTENUATION = 0.2    # Atenuação fixa por CF
SPLITTER_1x2_ATT = 3.7  # Atenuação splitter 1x2 (na última CF)
SPLITTER_10_90_ATT = 11.0   # Atenuação splitter 10/90 (porta 10%)
SPLITTER_20_80_ATT = 7.5   # Atenuação splitter 20/80 (porta 20%)
SPLITTER_30_70_ATT = 5.5   # Atenuação splitter 30/70 (porta 30%)
SPLITTER_1x16_ATT = 13.7   # Atenuação splitter 1x16
SPLITTER_10_90_PROP = 0.8  # Atenuação propagada (porta 90%)
SPLITTER_20_80_PROP = 1.1  # Atenuação propagada (porta 80%)
SPLITTER_30_70_PROP = 1.5  # Atenuação propagada (porta 70%)
SFP_POWER_DBM = 2.0  # Potência de saída do SFP (transmissor) em dBm
CC_ATTENUATION = 1.0  # Atenuação fixa por caixa CC
LAST_MILE_ATT = 0.0525  # Atenuação last mile após splitter 1x16
FINAL_CONNECTOR_ATT = 1.0  # Atenuação do conector final

def plotar_potencia_caminho(pontos, potencias, nome_final):
    # Garante que o diretório ./out exista
    os.makedirs("out", exist_ok=True)

    plt.figure(figsize=(16, 6))
    plt.plot(pontos, potencias, marker='o', color='green', linewidth=2)
    plt.xlabel('Ponto')
    plt.ylabel('Potência (dBm)')
    plt.title(f'Potência em dBm até {nome_final}')
    plt.xticks(rotation=90)
    plt.grid(True, which='both', linestyle='--', alpha=0.5)
    plt.tight_layout()

    base_path = os.path.join("out", f"potencia_{nome_final}")
    plt.savefig(base_path + ".pdf")
    plt.close()

def process_line(line):
    parts = [p.strip() for p in line.strip().split(" - ")]

    cf_indices = [i for i, e in enumerate(parts) if e.startswith("CF(")]
    cc_indices = [i for i, e in enumerate(parts) if e.startswith("CC(")]

    attenuations = []

    total_accum = 0.0
    last_valid_point = 0.0  # ponto para retomada após CC

    attenuations.append((parts[0], total_accum))  # POP

    cc_count = 0
    for i in range(1, len(parts), 2):
        dist = float(parts[i])
        elem = parts[i + 1]

        fiber_loss = dist * DB_PER_KM
        total_accum += fiber_loss

        # CF
        if elem.startswith("CF("):
            total_accum += CF_ATTENUATION
            if i + 1 == cf_indices[-1]:  # última CF
                total_accum += SPLITTER_1x2_ATT

        # CC
        elif elem.startswith("CC("):
            cc_count += 1
            total_accum += CC_ATTENUATION  # Atenuação fixa por caixa CC
            if cc_count == 1:
                # 1ª CC: splitter 10/90
                total_accum += SPLITTER_20_80_ATT + SPLITTER_1x16_ATT
                last_valid_point = attenuations[-1][1]
                retomar = last_valid_point + SPLITTER_20_80_PROP
            elif cc_count == 2:
                # 2ª CC: splitter 20/80
                total_accum += SPLITTER_30_70_ATT + SPLITTER_1x16_ATT
                last_valid_point = attenuations[-1][1]
                retomar = last_valid_point + SPLITTER_30_70_PROP
            elif cc_count == 3:
                # 3ª CC: splitter 30/70
                total_accum += SPLITTER_30_70_ATT + SPLITTER_1x16_ATT
                last_valid_point = attenuations[-1][1]
                retomar = last_valid_point + SPLITTER_30_70_PROP
            elif cc_count == 4:
                # 4ª CC: vai direto para 1x16 (porta 70)
                total_accum += SPLITTER_1x16_ATT
                # Não há ramal a retomar após a última CC

        attenuations.append((elem, total_accum))

        # Retomar só se não for a última CC
        if elem.startswith("CC(") and cc_count < 4:
            total_accum = retomar  # ramal de propagação continua aqui

    # Aplica last mile e conector final ao último ponto
    if len(attenuations) > 1:
        elem, att = attenuations[-1]
        att_final = att + LAST_MILE_ATT + FINAL_CONNECTOR_ATT
        attenuations[-1] = (elem, att_final)

    # Impressão em dBm
    print("Elemento     | Atenuação (dB) | Potência (dBm)")
    print("-----------------------------------------------")
    for elem, att in attenuations:
        power = SFP_POWER_DBM - att
        print(f"{elem:12} | {att:14.3f} | {power:14.3f}")

    print("\nPotência após splitter 1x16 (em dBm) nas caixas CC:")
    for i in cc_indices:
        elem = parts[i]
        idx = next((j for j, (e, _) in enumerate(attenuations) if e == elem), None)
        if idx is not None:
            att_cc = attenuations[idx][1]
            power_cc = SFP_POWER_DBM - att_cc
            print(f"{elem}: {power_cc:.3f} dBm")

    print("\n" + "="*50 + "\n")

    # --- NOVO: Plotar potência em dBm ---
    pontos = [elem for elem, _ in attenuations]
    potencias = [SFP_POWER_DBM - att for _, att in attenuations]
    plotar_potencia_caminho(pontos, potencias, pontos[-1])


def main():
    with open("caminhos.txt", "r") as f:
        for line in f:
            if line.strip():
                print("Processando linha:")
                print(line.strip())
                process_line(line)

if __name__ == "__main__":
    main()
''