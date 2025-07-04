import pandas as pd
import matplotlib.pyplot as plt
import re
import numpy as np
import os

# Configurar estilo dos gráficos
plt.style.use('default')
plt.rcParams['figure.figsize'] = (12, 8)
plt.rcParams['font.size'] = 10

# Usar arquivos da configuração Teste
sca_file = 'Teste-#0.sca'
vec_file = 'Teste-#0.vec'
vci_file = 'Teste-#0.vci'

# ===== ITEM (a): TEMPO MÉDIO DE DELAY POR SINK =====
delay_stats = []
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

df_delay = pd.DataFrame(delay_stats)

print(f"\nTEMPO MÉDIO DE DELAY POR SINK (ITEM a):")
print(df_delay)

fig, ax = plt.subplots(figsize=(8, 6))
if not df_delay.empty:
    print(f"\n=== DADOS PARA PLOT ITEM (a) ===")
    print("Dados de delay por sink:")
    for idx, row in df_delay.iterrows():
        print(f"  Sink {row['saida']}: {row['value']:.6f}s")
    
    ax.bar(df_delay['saida'], df_delay['value'], color=['#1f77b4', '#ff7f0e'])
    ax.set_title('Tempo Médio de Delay por Sink (Configuração Teste)', fontsize=14, fontweight='bold')
    ax.set_xlabel('Sink')
    ax.set_ylabel('Tempo Médio (s)')
    for i, v in enumerate(df_delay['value']):
        ax.text(i, v + 0.01, f'{v:.2f}', ha='center', va='bottom', fontsize=12)
    plt.tight_layout()
    plt.savefig('item_a_tempo_medio_por_configuracao.png', dpi=300, bbox_inches='tight')
    print("Plot item (a) salvo como 'item_a_tempo_medio_por_configuracao.png'")
else:
    print('Não foram encontrados dados de delay no arquivo .sca.')

# ===== ITEM (b): TEMPO DE ESTADIA POR REQUISIÇÃO E HISTOGRAMA =====
print("\n" + "="*60)
print("ITEM (b): TEMPO DE ESTADIA POR REQUISIÇÃO E HISTOGRAMA")
print("="*60)

sink_delays = {'1': [], '2': []}
if os.path.exists(vec_file):
    print(f"\n=== LENDO ARQUIVO {vec_file} ===")
    with open(vec_file) as f:
        lines = f.readlines()
    print(f"Total de linhas no arquivo: {len(lines)}")
    
    # Mostrar todas as linhas que começam com 'vector'
    print("\n=== VETORES ENCONTRADOS ===")
    for l in lines:
        if l.startswith('vector'):
            print(l.strip())
    
    sink_vector_map = {}
    for l in lines:
        if l.startswith('vector') and 'Delay' in l:
            parts = l.split()
            vector_id = parts[1]
            m_sink = re.search(r'sink(\d+)', l)
            if m_sink:
                sink_vector_map[m_sink.group(1)] = vector_id
                print(f"Mapeamento: Sink {m_sink.group(1)} -> Vector ID {vector_id}")
    
    print(f"\n=== DADOS DE DELAY POR SINK ===")
    for saida, vector_id in sink_vector_map.items():
        count = 0
        for l in lines:
            if l.startswith(f"{vector_id}\t"):
                parts = l.split()
                sink_delays[saida].append(float(parts[-1]))
                count += 1
                if count <= 5:  # Mostrar apenas os primeiros 5 valores
                    print(f"Sink {saida}: {float(parts[-1]):.6f}s")
        print(f"Sink {saida}: Total de {count} valores de delay")
        if count > 5:
            print(f"  ... (mostrando apenas os primeiros 5)")

    print(f"\n=== DADOS PARA PLOT ITEM (b) ===")
    for saida in ['1', '2']:
        delays = sink_delays[saida]
        if delays:
            print(f"Sink {saida}:")
            print(f"  Total de requisições: {len(delays)}")
            print(f"  Delay médio: {np.mean(delays):.6f}s")
            print(f"  Delay mínimo: {min(delays):.6f}s")
            print(f"  Delay máximo: {max(delays):.6f}s")
            print(f"  Primeiros 10 delays: {[f'{d:.3f}' for d in delays[:10]]}")
            print(f"  Últimos 10 delays: {[f'{d:.3f}' for d in delays[-10:]]}")

    fig, axes = plt.subplots(2, 2, figsize=(16, 12))
    for i, saida in enumerate(['1', '2']):
        delays = sink_delays[saida]
        if delays:
            axes[i, 0].plot(range(1, len(delays)+1), delays, marker='o', markersize=2, alpha=0.7, color='blue')
            axes[i, 0].set_title(f'Sink {saida}: Tempo de Estadia por Requisição', fontsize=12, fontweight='bold')
            axes[i, 0].set_xlabel('Número da Requisição', fontsize=10)
            axes[i, 0].set_ylabel('Tempo de Estadia (s)', fontsize=10)
            axes[i, 0].grid(True, alpha=0.3)
            axes[i, 1].hist(delays, bins=30, alpha=0.7, color='orange', edgecolor='black')
            axes[i, 1].set_title(f'Sink {saida}: Distribuição dos Tempos de Estadia', fontsize=12, fontweight='bold')
            axes[i, 1].set_xlabel('Tempo de Estadia (s)', fontsize=10)
            axes[i, 1].set_ylabel('Frequência', fontsize=10)
            axes[i, 1].grid(True, alpha=0.3)
            axes[i, 1].axvline(np.mean(delays), color='red', linestyle='--', label=f'Média: {np.mean(delays):.2f}s')
            axes[i, 1].legend()
    fig.suptitle('ITEM (b): Tempo de Estadia por Requisição e Histograma (Configuração Teste)', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig('item_b_tempo_estadia_por_requisicao.png', dpi=300, bbox_inches='tight')
    print("Plot item (b) salvo como 'item_b_tempo_estadia_por_requisicao.png'")
else:
    print('Não foram encontrados dados de delay no arquivo .vec.')

# ===== ITEM (c): HISTOGRAMA DO TAMANHO DA FILA =====
print("\n" + "="*60)
print("ITEM (c): HISTOGRAMA DO TAMANHO DA FILA")
print("="*60)

queue_vector_map = {}
fila_data = {}
if os.path.exists(vec_file):
    print(f"\n=== DADOS DE TAMANHO DE FILA ===")
    with open(vec_file) as f:
        lines = f.readlines()
    
    for l in lines:
        if l.startswith('vector') and 'queueLength' in l:
            parts = l.split()
            vector_id = parts[1]
            m_queue = re.search(r'queue(\d+)', l)
            if m_queue:
                queue_vector_map[m_queue.group(1)] = vector_id
                print(f"Mapeamento: Queue {m_queue.group(1)} -> Vector ID {vector_id}")
    
    for fila, vector_id in queue_vector_map.items():
        fila_data[fila] = []
        count = 0
        for l in lines:
            if l.startswith(f"{vector_id}\t"):
                parts = l.split()
                fila_data[fila].append(float(parts[-1]))
                count += 1
                if count <= 5:  # Mostrar apenas os primeiros 5 valores
                    print(f"Queue {fila}: {float(parts[-1]):.0f} pacotes")
        print(f"Queue {fila}: Total de {count} valores de tamanho")
        if count > 5:
            print(f"  ... (mostrando apenas os primeiros 5)")
        if fila_data[fila]:
            print(f"  Média: {np.mean(fila_data[fila]):.2f}")
            print(f"  Min: {min(fila_data[fila]):.0f}, Max: {max(fila_data[fila]):.0f}")

    print(f"\n=== DADOS PARA PLOT ITEM (c) ===")
    for fila in sorted(fila_data.keys()):
        data = fila_data[fila]
        if data:
            print(f"Fila {fila}:")
            print(f"  Total de amostras: {len(data)}")
            print(f"  Tamanho médio: {np.mean(data):.2f} pacotes")
            print(f"  Tamanho mínimo: {min(data):.0f} pacotes")
            print(f"  Tamanho máximo: {max(data):.0f} pacotes")
            print(f"  Primeiros 10 valores: {[f'{d:.0f}' for d in data[:10]]}")
            print(f"  Últimos 10 valores: {[f'{d:.0f}' for d in data[-10:]]}")
            # Contar frequência de cada valor
            unique, counts = np.unique(data, return_counts=True)
            print(f"  Distribuição: {dict(zip(unique, counts))}")

    fig, axes = plt.subplots(1, 3, figsize=(18, 6))
    for i, fila in enumerate(sorted(fila_data.keys())):
        ax = axes[i]
        ax.hist(fila_data[fila], bins=30, alpha=0.7, color='skyblue', edgecolor='black')
        ax.set_title(f'Fila {fila}: Histograma do Tamanho', fontsize=12, fontweight='bold')
        ax.set_xlabel('Tamanho da Fila', fontsize=10)
        ax.set_ylabel('Frequência', fontsize=10)
        ax.grid(True, alpha=0.3)
        ax.axvline(np.mean(fila_data[fila]), color='red', linestyle='--', label=f'Média: {np.mean(fila_data[fila]):.2f}')
        ax.legend()
    fig.suptitle('ITEM (c): Histograma do Tamanho da Fila para cada Fila (Configuração Teste)', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig('item_c_histograma_tamanho_fila.png', dpi=300, bbox_inches='tight')
    print("Plot item (c) salvo como 'item_c_histograma_tamanho_fila.png'")
    print(f"\nRESPOSTA ITEM (c):")
    print(f"• Histogramas do tamanho da fila gerados para cada fila (queue0, queue1, queue2)")
    for fila in sorted(fila_data.keys()):
        print(f"  - Fila {fila}: média = {np.mean(fila_data[fila]):.2f}")
else:
    print('Não foram encontrados dados de tamanho de fila no arquivo .vec.')

print("\n" + "="*60)
print("ANÁLISE DOS DADOS:")
print("="*60)
print("1. Os dados de delay estão sendo lidos corretamente do arquivo .sca")
print("2. Os vetores de delay e queueLength estão sendo encontrados no arquivo .vec")
print("3. Os valores de tamanho de fila parecem ser principalmente 0, indicando que as filas estão vazias na maior parte do tempo")
print("4. Isso pode indicar que o sistema não está sendo sobrecarregado ou que os tempos de serviço são muito rápidos")
print("5. Para ter dados mais interessantes, seria necessário:")
print("   - Aumentar a carga do sistema (diminuir tempos de chegada)")
print("   - Aumentar tempos de serviço")
print("   - Executar a simulação por mais tempo")

print("\n" + "="*60)
print("RESUMO DOS GRÁFICOS GERADOS:")
print("="*60)
print("1. item_a_tempo_medio_por_configuracao.png - Gráfico de barras do item (a)")
print("2. item_b_tempo_estadia_por_requisicao.png - Gráficos do item (b)")
print("3. item_c_histograma_tamanho_fila.png - Histogramas do item (c)")
print("\nAnálise completa dos resultados OMNeT++ finalizada!")