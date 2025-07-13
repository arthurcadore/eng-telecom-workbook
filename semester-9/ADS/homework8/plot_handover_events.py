import re
import matplotlib.pyplot as plt
from collections import defaultdict
import scienceplots
import os

# Diretório para salvar as figuras
pictures_dir = os.path.join(os.path.dirname(__file__), 'pictures')
os.makedirs(pictures_dir, exist_ok=True)

# Estilo visual
plt.style.use('science')
plt.rcParams["figure.figsize"] = (18, 9)
plt.rc('font', size=16)
plt.rc('axes', titlesize=22)
plt.rc('axes', labelsize=22)
plt.rc('xtick', labelsize=16)
plt.rc('ytick', labelsize=16)
plt.rc('legend', fontsize=16)
plt.rc('figure', titlesize=22)

# conifigura o line width
plt.rcParams['lines.linewidth'] = 3

# Caminho para o arquivo .vec
vec_file = 'General-#0.vec'

# --- Passo 1: Mapear vetores de interesse --- #
vector_map = {}  # id: (name, title)
vector_ap1 = []
vector_ap2 = []
vector_handover = [58]  # Forçado: Radio channel do host

with open(vec_file, 'r') as f:
    lines = f.readlines()
    for i, line in enumerate(lines):
        # Identifica cabeçalho de vetor
        m = re.match(r'vector (\d+) ([^ ]+) (.*)', line)
        if m:
            vid = int(m.group(1))
            vname = m.group(2)
            vrest = m.group(3)
            # Procura título do vetor
            title = ''
            for j in range(i+1, min(i+6, len(lines))):
                if lines[j].startswith('attr title'):
                    title = lines[j].split('attr title', 1)[1].strip().strip('"')
                    break
            vector_map[vid] = (vname, title)
            # AP1/2
            if '.ap1.' in vname:
                vector_ap1.append(vid)
            if '.ap2.' in vname:
                vector_ap2.append(vid)
            # Handover: aceitou conexão ou mudou canal
            if 'acceptConfirm' in vname or 'radioChannel' in vname:
                vector_handover.append(vid)

# --- Passo 2: Ler dados dos vetores --- #
data = defaultdict(list)  # vid: list of (time, value)

for line in lines:
    if re.match(r'\d+\t\d+\t', line):
        parts = line.strip().split('\t')
        if len(parts) < 4:
            continue
        vid = int(parts[0])
        time = float(parts[2])
        value = float(parts[3])
        data[vid].append((time, value))

# --- Passo 3: Plot 1 - Tempo vs AP conectado --- #
plt.figure(figsize=(14, 6))

# Busca vetores candidatos para handover/conexão do host
handover_keywords = [
    'radioChannel', 'radioChannelChanged', 'acceptConfirm', 'dropConfirm', 'connected', 'association', 'handover', 'AP', 'ssid'
]
vector_handover_auto = []
for vid, (vname, title) in vector_map.items():
    if (
        ('.host.' in vname or '.host' in vname) and
        any(kw in vname or kw in title for kw in handover_keywords)
    ):
        vector_handover_auto.append(vid)

if vector_handover or vector_handover_auto:
    vids = vector_handover if vector_handover else vector_handover_auto
    canais_unicos_globais = []
    canal_labels = {}
    canal_cores = {}
    cores = ['tab:blue', 'tab:orange', 'tab:green', 'tab:red']
    for vid in vids:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        import numpy as np
        times = np.array(times)
        values = np.array(values)
        if len(times) == 0:
            continue
        # Acumula canais únicos globais na ordem de ocorrência
        for v in values:
            if v not in canais_unicos_globais:
                canais_unicos_globais.append(v)
        # Labels e cores só para os canais realmente usados
    for i, c in enumerate(canais_unicos_globais):
        canal_cores[c] = cores[i % len(cores)]
        canal_labels[c] = f'Canal {int(c)}' if len(canais_unicos_globais) > 2 else (f'AP{i+1}')
    for vid in vids:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        times = np.array(times)
        values = np.array(values)
        if len(times) == 0:
            continue
        if len(times) == 1:
            plt.hlines(values[0], times[0], 60, colors=canal_cores[values[0]], linewidth=4, label=canal_labels[values[0]])
        else:
            for i in range(len(times)-1):
                canal = values[i]
                color = canal_cores[canal]
                label = canal_labels[canal] if i==0 or canal_labels[canal] not in plt.gca().get_legend_handles_labels()[1] else ""
                plt.hlines(canal, times[i], times[i+1], colors=color, linewidth=4, label=label)
            canal = values[-1]
            color = canal_cores[canal]
            label = canal_labels[canal] if canal_labels[canal] not in plt.gca().get_legend_handles_labels()[1] else ""
            plt.hlines(canal, times[-1], 60, colors=color, linewidth=4, label=label)
    plt.yticks(canais_unicos_globais, [canal_labels[c] for c in canais_unicos_globais])
    plt.xlabel('Tempo (s)')
    plt.ylabel('Canal conectado')
    plt.title('Tempo vs AP conectado (handover)')
    plt.xlim(0, 60)
    leg0 = plt.legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True
    )
    leg0.get_frame().set_facecolor('white')
    leg0.get_frame().set_edgecolor('black')
    leg0.get_frame().set_alpha(1.0) # Transparência
    plt.grid(True)
    plt.tight_layout()
      
    plt.savefig(os.path.join(pictures_dir, 'plot_handover.svg'), format='svg')
    plt.close()

else:
    print('\n[INFO] Nenhum vetor de handover identificado! Vetores candidatos:')
    for vid, (vname, title) in vector_map.items():
        if '.host.' in vname or '.host' in vname:
            print(f"  id={vid}  name={vname}  title={title}")

# --- NOVO: Plot de barras agrupadas - Contagem de eventos por tipo (AP1 x AP2) --- #
if vector_ap1 or vector_ap2:
    # Coletar todos os tipos de evento presentes em AP1 e AP2
    tipos_ap1 = {vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]: len(data[vid]) for vid in vector_ap1}
    tipos_ap2 = {vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]: len(data[vid]) for vid in vector_ap2}
    all_labels = sorted(set(list(tipos_ap1.keys()) + list(tipos_ap2.keys())))
    ap1_counts = [tipos_ap1.get(label, 0) for label in all_labels]
    ap2_counts = [tipos_ap2.get(label, 0) for label in all_labels]
    # Filtrar eventos sem contagem
    filtered = [
        (label, a1, a2)
        for label, a1, a2 in zip(all_labels, ap1_counts, ap2_counts)
        if (a1 > 0 or a2 > 0) and ('packetBytes' not in label)
    ]
    if filtered:
        all_labels, ap1_counts, ap2_counts = zip(*filtered)
        all_labels = list(all_labels)
        ap1_counts = list(ap1_counts)
        ap2_counts = list(ap2_counts)
    else:
        all_labels, ap1_counts, ap2_counts = [], [], []

    import numpy as np
    x = np.arange(len(all_labels))
    width = 0.38

    plt.figure(figsize=(14, 6))
    bars1 = plt.bar(x - width/2, ap1_counts, width, label='AP1', color='tab:blue')
    bars2 = plt.bar(x + width/2, ap2_counts, width, label='AP2', color='tab:orange')
    plt.xlabel('Tipo de evento (vetor)')
    plt.ylabel('Contagem de eventos')
    plt.title('Contagem de eventos por tipo (wireless) - AP1 x AP2')
    plt.xticks(x, all_labels, rotation=45, ha='right')
    leg0 = plt.legend(
        loc='upper right', frameon=True, edgecolor='black',
        facecolor='white', fontsize=12, fancybox=True
    )
    leg0.get_frame().set_facecolor('white')
    leg0.get_frame().set_edgecolor('black')
    leg0.get_frame().set_alpha(1.0)
    plt.tight_layout()
    # Adiciona os valores acima de cada barra
    for bar in bars1:
        height = bar.get_height()
        if height > 0:
            plt.text(bar.get_x() + bar.get_width()/2, height, f'{int(height)}', ha='center', va='bottom', fontsize=10)
    for bar in bars2:
        height = bar.get_height()
        if height > 0:
            plt.text(bar.get_x() + bar.get_width()/2, height, f'{int(height)}', ha='center', va='bottom', fontsize=10)
    
    plt.savefig(os.path.join(pictures_dir, 'plot2_eventos_ap1_ap2.svg'), format='svg')
    plt.close()

    # --- NOVO: Gráficos de linha por evento ao longo do tempo ---
    for idx, label in enumerate(all_labels):
        # Encontrar os vector_ids correspondentes para AP1 e AP2 desse label
        vids_ap1 = [vid for vid in vector_ap1 if (vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]) == label]
        vids_ap2 = [vid for vid in vector_ap2 if (vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]) == label]
        # Coletar todos os tempos e valores para cada AP
        times_ap1 = []
        times_ap2 = []
        for vid in vids_ap1:
            times_ap1.extend([t for t, v in data[vid]])
        for vid in vids_ap2:
            times_ap2.extend([t for t, v in data[vid]])
        # Gerar histogramas ao longo do tempo (contagem por bin de tempo)
        import numpy as np
        bin_width = 1.0  # segundos
        all_times = times_ap1 + times_ap2
        if not all_times:
            continue
        t_min = min(all_times)
        t_max = max(all_times)
        bins = np.arange(t_min, t_max + bin_width, bin_width)
        # Histograma para AP1
        counts_ap1, edges = np.histogram(times_ap1, bins=bins)
        # Histograma para AP2
        counts_ap2, _ = np.histogram(times_ap2, bins=bins)
        bin_centers = edges[:-1] + bin_width/2
        plt.figure(figsize=(14, 6))
        if np.any(counts_ap1):
            plt.step(bin_centers, counts_ap1, where='mid', label='AP1', color='tab:blue')
        if np.any(counts_ap2):
            plt.step(bin_centers, counts_ap2, where='mid', label='AP2', color='tab:orange')
        plt.xlabel('Tempo (s)')
        plt.ylabel('Contagem por segundo')
        plt.title(f'Evento: {label}')
        leg0 = plt.legend(
            loc='upper right', frameon=True, edgecolor='black',
            facecolor='white', fontsize=12, fancybox=True
        )
        leg0.get_frame().set_facecolor('white')
        leg0.get_frame().set_edgecolor('black')
        leg0.get_frame().set_alpha(1.0)
        plt.grid(True)
        plt.tight_layout()
        # Nome do arquivo seguro
        import re as _re
        fname = 'evento_' + _re.sub(r'[^\w\-_]+', '_', label) + '.svg'
        plt.savefig('./pictures/evento_' + _re.sub(r'[^\w\-_]+', '_', label) + '.svg', format='svg')
        plt.close()


else:
    print('Nenhum vetor AP1 ou AP2 identificado!')

# --- Fim --- #
print('Script finalizado. Ajuste os vetores de interesse conforme necessário.')
