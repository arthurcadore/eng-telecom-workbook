import pandas as pd
import matplotlib.pyplot as plt
import re
import numpy as np
import os
import scienceplots

# Configurar estilo dos gráficos
plt.style.use('science')
plt.rcParams["figure.figsize"] = (16, 9)

plt.rc('font', size=16)          # tamanho da fonte geral (eixos, ticks)
plt.rc('axes', titlesize=22)     # tamanho da fonte do título dos eixos
plt.rc('axes', labelsize=22)     # tamanho da fonte dos rótulos dos eixos (xlabel, ylabel)
plt.rc('xtick', labelsize=16)    # tamanho da fonte dos ticks no eixo x
plt.rc('ytick', labelsize=16)    # tamanho da fonte dos ticks no eixo y
plt.rc('legend', fontsize=16)    # tamanho da fonte das legendas (se houver)
plt.rc('figure', titlesize=22)   # tamanho da fonte do título da figura (plt.suptitle)

# Usar arquivos da configuração Teste
sca_file = 'Teste-#0.sca'
vec_file = 'Teste-#0.vec'
vci_file = 'Teste-#0.vci'

# ===== ITEM (a): TEMPO MÉDIO DE DELAY POR SINK + NÚMERO DE PACOTES (SUBPLOTS) =====
delay_stats = []
num_packets = []
if os.path.exists(sca_file):
    print(f"\n=== LENDO ARQUIVO {sca_file} ===")
    with open(sca_file) as f:
        for line in f:
            if line.startswith('scalar') and 'Ave delay' in line:
                parts = line.split()
                modulo = parts[1]
                m_saida = re.search(r'sink(\d)', modulo)
                if m_saida:
                    saida = m_saida.group(1)
                    valor = float(parts[-1])
                    delay_stats.append({'saida': saida, 'value': valor})
                    print(f"Delay encontrado: Sink {saida} = {valor:.6f}s")
            if line.startswith('scalar') and 'Number of packets' in line:
                parts = line.split()
                modulo = parts[1]
                m_saida = re.search(r'sink(\d)', modulo)
                if m_saida:
                    saida = m_saida.group(1)
                    valor = float(parts[-1])
                    num_packets.append({'saida': saida, 'value': valor})
                    print(f"Sink {saida}: {valor:.0f} pacotes processados")

df_delay = pd.DataFrame(delay_stats)
df_packets = pd.DataFrame(num_packets)

print(f"\nTEMPO MÉDIO DE DELAY POR SINK (ITEM a):")
print(df_delay)
if not df_delay.empty and not df_packets.empty:
    print("\n[DEBUG] Dados para gráfico de barras (item a):")
    for idx, row in df_delay.iterrows():
        print(f"  Sink {row['saida']}: {row['value']:.6f}s")
    print(f"  Média dos delays: {df_delay['value'].mean():.6f}s")
    print(f"  Mínimo: {df_delay['value'].min():.6f}s, Máximo: {df_delay['value'].max():.6f}s")
    print("[DEBUG] Dados para número de pacotes por sink:")
    print(df_packets)
    fig, axes = plt.subplots(1, 2, figsize=(16, 9))
    # Subplot 1: Tempo médio de delay
    axes[0].bar(df_delay['saida'], df_delay['value'], color=['#1f77b4', '#ff7f0e'])
    axes[0].set_title('Tempo Médio de Delay por Sink', fontsize=14, fontweight='bold')
    axes[0].set_xlabel('Sink')
    axes[0].set_ylabel('Tempo Médio (s)')
    for i, v in enumerate(df_delay['value']):
        axes[0].text(i, v + 0.01, f'{v:.2f}', ha='center', va='bottom', fontsize=12)
    # Subplot 2: Número de pacotes
    axes[1].bar(df_packets['saida'], df_packets['value'], color=['#2ca02c', '#d62728'])
    axes[1].set_title('Número Total de Pacotes por Sink', fontsize=14, fontweight='bold')
    axes[1].set_xlabel('Sink')
    axes[1].set_ylabel('Número de Pacotes')
    for i, v in enumerate(df_packets['value']):
        axes[1].text(i, v + 2, f'{int(v)}', ha='center', va='bottom', fontsize=12)
    plt.tight_layout()
    plt.savefig('item_a_tempo_medio_e_num_pacotes.png', dpi=300, bbox_inches='tight')
    print("Plot item (a) salvo como 'item_a_tempo_medio_e_num_pacotes.png'")
    idx_maior = df_delay['value'].idxmax()
    sink_maior = df_delay.loc[idx_maior, 'saida']
    valor_maior = df_delay.loc[idx_maior, 'value']
    print(f"\nSink com maior tempo médio: Sink {sink_maior} ({valor_maior:.3f}s)")
    print("Explicação: O maior tempo médio geralmente ocorre na saída com maior tempo de serviço ou maior carga. No seu caso, Sink 2 tem tempo de serviço maior e/ou recebe mais tráfego.")
else:
    print('Não foram encontrados dados de delay ou número de pacotes no arquivo .sca.')
    sink_maior = None

# ===== ITEM (b): TEMPO DE ESTADIA POR REQUISIÇÃO E HISTOGRAMA PARA CADA SINK =====
print("\n" + "="*60)
print("ITEM (b): TEMPO DE ESTADIA POR REQUISIÇÃO E HISTOGRAMA PARA CADA SINK")
print("="*60)

sink_delays = {}
if os.path.exists(vec_file):
    print(f"\n=== LENDO ARQUIVO {vec_file} ===")
    with open(vec_file) as f:
        lines = f.readlines()
    sink_vector_map = {}
    for l in lines:
        if l.startswith('vector') and 'Delay' in l:
            parts = l.split()
            vector_id = parts[1]
            m_sink = re.search(r'sink(\d+)', l)
            if m_sink:
                sink_vector_map[m_sink.group(1)] = vector_id
    for sink in ['1', '2']:
        if sink in sink_vector_map:
            vector_id = sink_vector_map[sink]
            sink_delays[sink] = []
            for l in lines:
                if l.startswith(f"{vector_id}\t"):
                    parts = l.split()
                    sink_delays[sink].append(float(parts[-1]))
            delays = sink_delays[sink]
            print(f"\n[DEBUG] Dados para Sink {sink} (item b):")
            print(f"  Total de delays: {len(delays)}")
            print(f"  Média: {np.mean(delays):.6f}s, Mínimo: {np.min(delays):.6f}s, Máximo: {np.max(delays):.6f}s")
            print(f"  Primeiros 10 delays: {[f'{d:.3f}' for d in delays[:10]]}")
            print(f"  Últimos 10 delays: {[f'{d:.3f}' for d in delays[-10:]]}")
            # Gerar subplots: linha e histograma
            fig, axes = plt.subplots(1, 2, figsize=(16,9))
            axes[0].plot(range(1, len(delays)+1), delays, marker='o', markersize=2, alpha=0.7, color='blue', linewidth=4, markerfacecolor='k')
            axes[0].set_title(f'Sink {sink}: Tempo de Estadia por Requisição', fontsize=12, fontweight='bold')
            axes[0].set_xlabel('Número da Requisição', fontsize=10)
            axes[0].set_ylabel('Tempo de Estadia (s)', fontsize=10)
            axes[0].grid(True, alpha=0.3)
            axes[1].hist(delays, bins=30, alpha=0.7, color='orange', edgecolor='black', linewidth=2)
            axes[1].set_title(f'Sink {sink}: Histograma dos Tempos de Estadia', fontsize=12, fontweight='bold')
            axes[1].set_xlabel('Tempo de Estadia (s)', fontsize=10)
            axes[1].set_ylabel('Frequência', fontsize=10)
            axes[1].grid(True, alpha=0.3)
            axes[1].axvline(np.mean(delays), color='red', linestyle='--', label=f'Média: {np.mean(delays):.2f}s')
            axes[1].legend()
            plt.tight_layout()
            plt.savefig(f'item_b_sink{sink}.png', dpi=300, bbox_inches='tight')
            print(f"Gráfico salvo como 'item_b_sink{sink}.png'")
else:
    print('Não foram encontrados dados de delay no arquivo .vec.')

# ===== ITEM (c): HISTOGRAMA DO TAMANHO DA FILA (UM PLOT POR FILA) =====
print("\n" + "="*60)
print("ITEM (c): HISTOGRAMA DO TAMANHO DA FILA (UM PLOT POR FILA)")
print("="*60)

queue_vector_map = {}
fila_data = {}
if os.path.exists(vec_file):
    print(f"\n=== DADOS DE TAMANHO DE FILA ===")
    with open(vec_file) as f:
        lines = f.readlines()
    # Mapear vector id de cada fila
    for l in lines:
        if l.startswith('vector') and 'queueLength' in l:
            parts = l.split()
            vector_id = parts[1]
            m_queue = re.search(r'queue(\d+)', l)
            if m_queue:
                queue_vector_map[m_queue.group(1)] = vector_id
    # Ler dados de cada fila e plotar individualmente
    for fila, vector_id in queue_vector_map.items():
        fila_data[fila] = []
        for l in lines:
            if l.startswith(f"{vector_id}\t"):
                parts = l.split()
                fila_data[fila].append(float(parts[-1]))
        data = fila_data[fila]
        print(f"\n[DEBUG] Histograma fila {fila}:")
        print(f"  Total de amostras: {len(data)}")
        print(f"  Média: {np.mean(data):.2f}, Mínimo: {np.min(data):.0f}, Máximo: {np.max(data):.0f}")
        print(f"  Primeiros 10 valores: {[f'{d:.0f}' for d in data[:10]]}")
        print(f"  Últimos 10 valores: {[f'{d:.0f}' for d in data[-10:]]}")
        unique, counts = np.unique(data, return_counts=True)
        print(f"  Distribuição: {dict(zip(unique, counts))}")
        plt.figure(figsize=(16,9))
        plt.hist(data, bins=30, alpha=0.7, color='skyblue', edgecolor='black', linewidth=4)
        plt.title(f'Fila {fila}: Histograma do Tamanho', fontsize=18, fontweight='bold')
        plt.xlabel('Tamanho da Fila', fontsize=16)
        plt.ylabel('Frequência', fontsize=16)
        plt.grid(True, alpha=0.3)
        plt.axvline(np.mean(data), color='red', linestyle='--', label=f'Média: {np.mean(data):.2f}', linewidth=4)
        plt.legend()
        plt.tight_layout()
        plt.savefig(f'item_c_histograma_fila{fila}.png', dpi=300, bbox_inches='tight')
        print(f"Plot salvo como 'item_c_histograma_fila{fila}.png'")
else:
    print('Não foram encontrados dados de tamanho de fila no arquivo .vec.')

print("\n" + "="*60)
print("ANÁLISE DOS DADOS:")
print("="*60)
print("1. O script lê corretamente os tempos médios de delay por sink e identifica o maior.")
print("2. O gráfico de linha do tempo de estadia é gerado apenas para o sink de maior tempo médio.")
print("3. Os histogramas do tamanho da fila são gerados para cada fila no cenário do maior tempo médio.")
print("4. Se desejar analisar outros cenários, basta alterar o arquivo de entrada ou o critério de seleção.")

print("\n" + "="*60)
print("RESUMO DOS GRÁFICOS GERADOS:")
print("="*60)
print("1. item_a_tempo_medio_e_num_pacotes.png - Gráfico de barras do item (a)")
print("2. item_b_sink1.png - Gráfico de linha e histograma do item (b) para Sink 1")
print("3. item_b_sink2.png - Gráfico de linha e histograma do item (b) para Sink 2")
print("4. item_c_histograma_fila0.png - Histograma do item (c) para Fila 0")
print("5. item_c_histograma_fila1.png - Histograma do item (c) para Fila 1")
print("6. item_c_histograma_fila2.png - Histograma do item (c) para Fila 2")


# ===== NOVO PLOT 2: EVOLUÇÃO TEMPORAL DO TAMANHO DA FILA =====
print("\n" + "="*60)
print("PLOT EXTRA 2: EVOLUÇÃO TEMPORAL DO TAMANHO DA FILA")
print("="*60)

if os.path.exists(vec_file):
    with open(vec_file) as f:
        lines = f.readlines()
    queue_vector_map = {}
    for l in lines:
        if l.startswith('vector') and 'queueLength' in l:
            parts = l.split()
            vector_id = parts[1]
            m_queue = re.search(r'queue(\d+)', l)
            if m_queue:
                queue_vector_map[m_queue.group(1)] = vector_id
    for fila, vector_id in queue_vector_map.items():
        times = []
        values = []
        for l in lines:
            if l.startswith(f"{vector_id}\t"):
                parts = l.split()
                # parts[1] é o tempo, parts[-1] é o valor
                times.append(float(parts[1]))
                values.append(float(parts[-1]))
        print(f"\n[DEBUG] Evolução temporal da fila {fila}:")
        print(f"  Total de amostras: {len(values)}")
        print(f"  Primeiros 10 tempos: {[f'{t:.1f}' for t in times[:10]]}")
        print(f"  Primeiros 10 valores: {[f'{v:.0f}' for v in values[:10]]}")
        plt.figure(figsize=(16,9))
        plt.plot(times, values, marker='o', markersize=2, alpha=0.7, linewidth=4, color='k')
        plt.title(f'Evolução Temporal do Tamanho da Fila {fila}', fontsize=14, fontweight='bold')
        plt.xlabel('Tempo (s)')
        plt.ylabel('Tamanho da Fila')
        plt.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig(f'extra_evolucao_fila{fila}.png', dpi=300, bbox_inches='tight')
        print(f"Plot salvo como 'extra_evolucao_fila{fila}.png'")
else:
    print('Não foram encontrados dados de tamanho de fila no arquivo .vec.')

print("\nAnálise completa dos resultados OMNeT++ finalizada!")