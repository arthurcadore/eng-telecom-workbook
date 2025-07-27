import re
import os
import pandas as pd
from collections import defaultdict

# Arquivos
VCI_FILE = "results/General-#0.vci"
VEC_FILE = "results/General-#0.vec"
SCA_FILE = "results/General-#0.sca"
OUTPUT_DIR = "./results-csv"

# Criar pasta de saída, se não existir
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Métricas alvo por substring
INTEREST_METRICS = [
    "tcp", "udp", "handover", "snir", "ber", "signalstrength", "packeterrorrate",
    "retries", "retransmissions", "packetloss", "latency", "duration", "throughput"
]

def is_metric_interesting(name):
    return any(metric in name.lower() for metric in INTEREST_METRICS)

vec_info = {}

# 1. Parse .vci
if os.path.isfile(VCI_FILE):
    with open(VCI_FILE, 'r') as f:
        for line in f:
            if line.startswith("vector"):
                parts = re.findall(r'"[^"]*"|\S+', line.strip())
                if len(parts) >= 4:
                    vec_id = parts[1]
                    module = parts[2].strip('"')
                    name = parts[3].strip('"')
                    vec_info[vec_id] = {"module": module, "name": name}
    print(f"[✓] Vetores encontrados no .vci: {len(vec_info)}")
else:
    print("[!] Arquivo .vci não encontrado. Vetores terão nomes genéricos.")

# 2. Parse .vec
data = defaultdict(list)
with open(VEC_FILE, 'r') as f:
    for line in f:
        if re.match(r'^\d+', line):
            parts = line.strip().split()
            if len(parts) >= 3:
                vec_id, time, value = parts[0], parts[1], parts[2]
                data[vec_id].append((float(time), float(value)))

# 3. Exportar CSVs
summary = []
exported = 0

for vec_id, samples in data.items():
    info = vec_info.get(vec_id, {"module": "unknown", "name": f"metric_{vec_id}"})
    df = pd.DataFrame(samples, columns=["time", "value"])
    df["module"] = info["module"]
    df["metric"] = info["name"]
    filename = f"vec_{info['name'].replace(' ', '_')}_{vec_id}.csv"
    filepath = os.path.join(OUTPUT_DIR, filename)
    df.to_csv(filepath, index=False)
    print(f"[✓] Exportado vetor: {filepath}")
    summary.append({
        "vec_id": vec_id,
        "module": info["module"],
        "name": info["name"],
        "filename": filename
    })
    exported += 1

if exported == 0:
    print("[!] Nenhum vetor exportado.")
else:
    df_summary = pd.DataFrame(summary)
    df_summary.to_csv(os.path.join(OUTPUT_DIR, "vetores_exportados_resumo.csv"), index=False)
    print(f"[✓] Mapeamento salvo em: {os.path.join(OUTPUT_DIR, 'vetores_exportados_resumo.csv')}")


import matplotlib.pyplot as plt

def plot_csv_as_svg(filepath, title, output_dir):
    df = pd.read_csv(filepath)
    if df.empty or len(df) < 2:
        print(f"[!] CSV vazio ou com poucos pontos, pulando: {filepath}")
        return

    # Detectar se valor é acumulativo e extrair deltas
    df["delta_value"] = df["value"].diff()
    df["delta_time"] = df["time"].diff()

    # Normalizar tempo para iniciar em 0 (opcional)
    df["time_norm"] = df["time"] - df["time"].iloc[0]

    # Remover a primeira linha com NaN após diff
    df_clean = df.dropna()

    # Gráfico: variação por tempo real
    plt.figure(figsize=(10, 4))
    plt.plot(df_clean["time_norm"], df_clean["delta_value"], label="Δvalue per sample")
    plt.xlabel("Time (s)")
    plt.ylabel("Delta Value")
    plt.title(title)
    plt.grid(True)
    plt.tight_layout()
    plt.legend()

    svg_filename = os.path.splitext(os.path.basename(filepath))[0] + ".svg"
    svg_path = os.path.join(output_dir, svg_filename)
    plt.savefig(svg_path, format="svg")
    plt.close()
    print(f"[✓] Exportado gráfico SVG (delta): {svg_path}")


# Gerar gráficos SVG para cada CSV exportado
for row in summary:
    csv_path = os.path.join(OUTPUT_DIR, row["filename"])
    title = f"{row['name']} ({row['module']})"
    plot_csv_as_svg(csv_path, title, OUTPUT_DIR)
