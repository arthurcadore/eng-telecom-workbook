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
vec_file = './results/General-#0.vec'

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

    # --- NOVO: Plot de estatísticas de tráfego TCP e UDP --- #
    udp_vectors = []
    tcp_vectors = []

    # Coletar vetores UDP e TCP
    for vid, (vname, title) in vector_map.items():
        if 'udpApp' in vname:
            udp_vectors.append(vid)
        elif 'tcpApp' in vname:
            tcp_vectors.append(vid)

    if udp_vectors or tcp_vectors:
        # Coletar dados de UDP
        udp_data = defaultdict(list)
        for vid in udp_vectors:
            times = [t for t, v in data[vid]]
            values = [v for t, v in data[vid]]
            udp_data[vector_map[vid][1]].extend(values)
        
        # Coletar dados de TCP
        tcp_data = defaultdict(list)
        for vid in tcp_vectors:
            times = [t for t, v in data[vid]]
            values = [v for t, v in data[vid]]
            tcp_data[vector_map[vid][1]].extend(values)
        
        # Criar plot
        plt.figure(figsize=(14, 6))
        
        # Dados UDP
        udp_stats = []
        udp_labels = []
        if udp_data:
            for label, values in udp_data.items():
                if values:
                    udp_stats.append(sum(values))  # Total de bytes
                    udp_labels.append(f'UDP {label}')
        
        # Dados TCP
        tcp_stats = []
        tcp_labels = []
        if tcp_data:
            for label, values in tcp_data.items():
                if values:
                    tcp_stats.append(sum(values))  # Total de bytes
                    tcp_labels.append(f'TCP {label}')
        
        # Plotar dados
        width = 0.38
        x = np.arange(len(udp_stats + tcp_stats))
        
        # Plotar UDP
        if udp_stats:
            bars1 = plt.bar(x[:len(udp_stats)], udp_stats, width, label='UDP', color='tab:blue')
            # Adicionar valores acima das barras
            for i, bar in enumerate(bars1):
                plt.text(bar.get_x() + bar.get_width()/2, bar.get_height(), 
                         f'{int(bar.get_height())} bytes', 
                         ha='center', va='bottom', fontsize=10)
        
        # Plotar TCP
        if tcp_stats:
            bars2 = plt.bar(x[len(udp_stats):], tcp_stats, width, label='TCP', color='tab:orange')
            # Adicionar valores acima das barras
            for i, bar in enumerate(bars2):
                plt.text(bar.get_x() + bar.get_width()/2, bar.get_height(), 
                         f'{int(bar.get_height())} bytes', 
                         ha='center', va='bottom', fontsize=10)
        
        plt.xlabel('Tipo de tráfego')
        plt.ylabel('Bytes transferidos')
        plt.title('Estatísticas de tráfego TCP e UDP')
        plt.xticks(x, udp_labels + tcp_labels, rotation=45, ha='right')
        
        if udp_stats or tcp_stats:
            leg0 = plt.legend(
                loc='upper right', frameon=True, edgecolor='black',
                facecolor='white', fontsize=12, fancybox=True
            )
            leg0.get_frame().set_facecolor('white')
            leg0.get_frame().set_edgecolor('black')
            leg0.get_frame().set_alpha(1.0)
        
        plt.tight_layout()
        plt.savefig(os.path.join(pictures_dir, 'plot_traffic_stats.svg'), format='svg')
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

# --- Passo 4: Plot de pacotes enviados/recebidos por AP --- #
if vector_ap1 or vector_ap2:
    # Coletar vetores relacionados a pacotes e bytes
    packet_vectors = []
    byte_vectors = []
    for vid, (vname, title) in vector_map.items():
        if 'packet' in vname or 'packet' in title:
            if '.ap1.' in vname:
                packet_vectors.append(vid)
            elif '.ap2.' in vname:
                packet_vectors.append(vid)
        if 'bytes' in vname or 'bytes' in title:
            if '.ap1.' in vname:
                byte_vectors.append(vid)
            elif '.ap2.' in vname:
                byte_vectors.append(vid)

    # Plot de pacotes enviados/recebidos
    plt.figure(figsize=(14, 6))
    for vid in packet_vectors:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if not times:
            continue
        ap = 'AP1' if '.ap1.' in vector_map[vid][0] else 'AP2'
        plt.plot(times, values, label=f'{ap} - {vector_map[vid][1]}', marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Pacotes')
    plt.title('Pacotes enviados/recebidos por AP')
    plt.xlim(0, 60)
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.savefig(os.path.join(pictures_dir, 'plot_packets.svg'), format='svg')
    plt.close()

    # Plot de bytes enviados/recebidos
    plt.figure(figsize=(14, 6))
    for vid in byte_vectors:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if not times:
            continue
        ap = 'AP1' if '.ap1.' in vector_map[vid][0] else 'AP2'
        plt.plot(times, values, label=f'{ap} - {vector_map[vid][1]}', marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Bytes')
    plt.title('Bytes enviados/recebidos por AP')
    plt.xlim(0, 60)
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.savefig(os.path.join(pictures_dir, 'plot_bytes.svg'), format='svg')
    plt.close()

    # Plot combinado de pacotes e bytes
    plt.figure(figsize=(14, 6))
    for vid in packet_vectors + byte_vectors:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if not times:
            continue
        ap = 'AP1' if '.ap1.' in vector_map[vid][0] else 'AP2'
        label = f'{ap} - {vector_map[vid][1]}'
        if 'bytes' in label.lower():
            plt.plot(times, values, label=label, linestyle='--', marker='x')
        else:
            plt.plot(times, values, label=label, marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Quantidade')
    plt.title('Pacotes e bytes enviados/recebidos por AP')
    plt.xlim(0, 60)
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.savefig(os.path.join(pictures_dir, 'plot_combined.svg'), format='svg')
    plt.close()

# --- Passo 5: Plot de estatísticas de handover --- #
# Coletar vetores de handover
handover_vectors = []
for vid, (vname, title) in vector_map.items():
    if any(kw in vname or kw in title for kw in ['handoverAttempts', 'handoverSuccesses', 'handoverFailures',
                                               'handoverDuration', 'handoverLatency']):
        if '.host1.' in vname or '.host1' in vname:
            handover_vectors.append(vid)

if handover_vectors:
    plt.figure(figsize=(14, 6))
    plt.suptitle('Estatísticas de Handover')
    
    # Subplot 1: Tentativas, Sucessos e Falhas
    plt.subplot(2, 2, 1)
    for vid in handover_vectors:
        vname, title = vector_map[vid]
        if any(kw in vname or kw in title for kw in ['handoverAttempts', 'handoverSuccesses', 'handoverFailures']):
            times = [t for t, v in data[vid]]
            values = [v for t, v in data[vid]]
            if times:
                label = title if title else vname
                plt.plot(times, values, label=label.replace('handover', '').title(), marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Contagem')
    plt.title('Tentativas, Sucessos e Falhas')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    # Subplot 2: Duração
    plt.subplot(2, 2, 2)
    for vid in handover_vectors:
        vname, title = vector_map[vid]
        if any(kw in vname or kw in title for kw in ['handoverDuration']):
            times = [t for t, v in data[vid]]
            values = [v for t, v in data[vid]]
            if times:
                label = title if title else vname
                plt.plot(times, values, label=label.replace('handover', '').title(), marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Duração (s)')
    plt.title('Duração do Handover')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    # Subplot 3: Latência
    plt.subplot(2, 2, 3)
    for vid in handover_vectors:
        vname, title = vector_map[vid]
        if any(kw in vname or kw in title for kw in ['handoverLatency']):
            times = [t for t, v in data[vid]]
            values = [v for t, v in data[vid]]
            if times:
                label = title if title else vname
                plt.plot(times, values, label=label.replace('handover', '').title(), marker='o')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Latência (s)')
    plt.title('Latência do Handover')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.savefig(os.path.join(pictures_dir, 'plot_handover_stats.svg'), format='svg')
    plt.close()
    print(f'Plot de estatísticas de handover gerado com sucesso em {pictures_dir}/plot_handover_stats.svg')
else:
    print('Nenhum vetor de estatísticas de handover encontrado!')

# --- Passo 6: Plot de estatísticas UDP e TCP --- #
# Coletar vetores UDP e TCP
udp_vectors = {'host1': {'sent': [], 'received': []},
              'host2': {'received': []}}
tcp_vectors = {'host1': {'sent': [], 'received': []},
              'host2': {'received': []}}

# Função auxiliar para adicionar vetor
def add_to_dict(d, host, direction, vid):
    if host in d:
        d[host][direction].append(vid)

# Coletar vetores
for vid, (vname, title) in vector_map.items():
    if '.udpApp' in vname:
        if 'sent' in vname or 'sent' in title:
            if '.host1.' in vname:
                add_to_dict(udp_vectors, 'host1', 'sent', vid)
        elif 'received' in vname or 'received' in title:
            if '.host1.' in vname:
                add_to_dict(udp_vectors, 'host1', 'received', vid)
            elif '.host2.' in vname:
                add_to_dict(udp_vectors, 'host2', 'received', vid)
    elif '.tcpApp' in vname:
        if 'sent' in vname or 'sent' in title:
            if '.host1.' in vname:
                add_to_dict(tcp_vectors, 'host1', 'sent', vid)
        elif 'received' in vname or 'received' in title:
            if '.host1.' in vname:
                add_to_dict(tcp_vectors, 'host1', 'received', vid)
            elif '.host2.' in vname:
                add_to_dict(tcp_vectors, 'host2', 'received', vid)

# Plotar estatísticas UDP e TCP
if udp_vectors or tcp_vectors:
    plt.figure(figsize=(14, 6))
    
    # Subplot 1: UDP - Host1
    plt.subplot(2, 2, 1)
    plt.title('UDP - Host1')
    for vid in udp_vectors['host1']['sent']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='o')
    for vid in udp_vectors['host1']['received']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='x')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Quantidade')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    # Subplot 2: UDP - Host2
    plt.subplot(2, 2, 2)
    plt.title('UDP - Host2')
    for vid in udp_vectors['host2']['received']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='x')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Quantidade')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    # Subplot 3: TCP - Host1
    plt.subplot(2, 2, 3)
    plt.title('TCP - Host1')
    for vid in tcp_vectors['host1']['sent']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='o')
    for vid in tcp_vectors['host1']['received']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='x')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Quantidade')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    # Subplot 4: TCP - Host2
    plt.subplot(2, 2, 4)
    plt.title('TCP - Host2')
    for vid in tcp_vectors['host2']['received']:
        times = [t for t, v in data[vid]]
        values = [v for t, v in data[vid]]
        if times:
            label = f"{vector_map[vid][1] if vector_map[vid][1] else vector_map[vid][0]}"
            plt.plot(times, values, label=label, marker='x')
    plt.xlabel('Tempo (s)')
    plt.ylabel('Quantidade')
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    
    plt.suptitle('Estatísticas UDP e TCP')
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.savefig(os.path.join(pictures_dir, 'plot_udp_tcp_stats.svg'), format='svg')
    plt.close()
    print(f'Plot de estatísticas UDP/TCP gerado com sucesso em {pictures_dir}/plot_udp_tcp_stats.svg')
else:
    print('Nenhum vetor de estatísticas UDP/TCP encontrado!')

# --- Fim --- #
print('Script finalizado. Ajuste os vetores de interesse conforme necessário.')
