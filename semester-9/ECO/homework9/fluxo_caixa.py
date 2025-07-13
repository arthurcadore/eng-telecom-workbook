from collections import defaultdict
import pandas as pd
import matplotlib.pyplot as plt
import scienceplots

# Estilo visual
# plt.style.use('science')
plt.rcParams["figure.figsize"] = (16, 9)
plt.rc('font', size=16)
plt.rc('axes', titlesize=22)
plt.rc('axes', labelsize=22)
plt.rc('xtick', labelsize=16)
plt.rc('ytick', labelsize=16)
plt.rc('legend', fontsize=16)
plt.rc('figure', titlesize=22)


# Configurações
anos = 6
meses_total = anos * 12
clientes_mensal = 20
numero_clientes = 1280
investimento_inicial = 70000

# Distribuição de planos por cliente
planos_percentuais = {
    "100Mbps": 0.70,
    "200Mbps": 0.20,
    "500Mbps": 0.10
}

# Preço mensal dos planos
precos_planos = {
    "100Mbps": 50,
    "200Mbps": 100,
    "500Mbps": 150,
}

# Receita taxa de instalação por novo cliente
taxa_instalacao = 100

# Custo da ONU por cliente
custo_onu = 88

# Aluguéis fixos mensais
alugueis = [
    {"nome": "POP - Ponto de Presença", "custo_mensal": 3500, "quantidade": 1},
    {"nome": "Poste", "custo_mensal": 10, "quantidade": 338},
    {"nome": "Uplink", "custo_mensal": 10000, "quantidade": 1}
]
custo_mensal_alugueis = sum(x["custo_mensal"] * x["quantidade"] for x in alugueis)

# Equipamentos passivos para instalação de fibra
equipamentos_passivos = [
    {"nome": "Rack de telecomunicações 10U", "custo_Vista": 3000, "quantidade": 1},
    {"nome": "DIO 12x2", "custo_Vista": 3000, "quantidade": 1},
    {"nome": "Splitter 1x16", "custo_Vista": 50, "quantidade": 72},
    {"nome": "Splitter 1x2", "custo_Vista": 50, "quantidade": 8},
    {"nome": "Splitter Desbalanceado 10/90", "custo_Vista": 50, "quantidade": 0},
    {"nome": "Splitter Desbalanceado 20/80", "custo_Vista": 50, "quantidade": 24},
    {"nome": "Splitter Desbalanceado 30/70", "custo_Vista": 50, "quantidade": 48},
    {"nome": "Splitter Desbalanceado 40/60", "custo_Vista": 50, "quantidade": 0},
    {"nome": "Conector SC/APC", "custo_Vista": 1.5, "quantidade": 1280},
    {"nome": "Patch-cord fibra óptica 1 metro", "custo_Vista": 5, "quantidade": 1280},
]

# Equipamentos de lançamento para instalação de fibra
equipamentos_lancamento = [
    {"nome": "Mini-RA 12FO", "custo_Vista": 4, "quantidade": 2000},
    {"nome": "Mini-RA 6FO", "custo_Vista": 1, "quantidade": 12000},
    {"nome": "Drop 1FO", "custo_Vista": 0.45, "quantidade": 30000},
    {"nome": "Caixa de emenda - Fusão", "custo_Vista": 200, "quantidade": 8},
    {"nome": "Caixa de emenda - Conectorizada", "custo_Vista": 200, "quantidade": 72},
    {"nome": "Caixa de terminação", "custo_Vista": 5, "quantidade": 1280},
    {"nome": "Abraçadeira-BAP-3", "custo_Vista": 1, "quantidade": 338},
    {"nome": "Isolador BAP-3", "custo_Vista": 1, "quantidade": 338},
    {"nome": "Alça Preformada", "custo_Vista": 1, "quantidade": 338}
]

# Cálculo do custo total dos equipamentos passivos e de lançamento
custo_passivos = sum(item["custo_Vista"] * item["quantidade"] for item in equipamentos_passivos)
custo_lancamento = sum(item["custo_Vista"] * item["quantidade"] for item in equipamentos_lancamento)
custo_pon_inicial = custo_passivos + custo_lancamento

# Lista completa de mão de obra
mao_de_obra = [
    {"nome": "Instalação POP", "custo": 10000, "quantidade": 1},
    {"nome": "Instalação Infraestrutura PON", "custo": 1, "quantidade": 10000},
    {"nome": "Fusões", "custo": 1, "quantidade": 100},
]
# Custos iniciais de mão de obra (apenas POP, Infraestrutura PON e Fusões)
custo_mao_obra_inicial = sum(
    item["custo"] * item["quantidade"]
    for item in mao_de_obra
    if item["nome"] in ["Instalação POP", "Instalação Infraestrutura PON", "Fusões"]
)
# Custo mensal de instalação residencial (30 clientes/mês, R$ 50 por cliente)
custo_mao_obra_residencial_mensal = 30 * 350

# Parcelamento dos ativos (12x onde aplicável, 10x para OLT)
parcelamentos = defaultdict(float)

equipamentos_ativos = [
    {"nome": "Chassi Olt An6000-2 02u 10g", "custo_10x": 4066, "quantidade": 1, "parcelas": 10},
    {"nome": "Placa GPOA", "custo_12x": 9890, "quantidade": 1, "parcelas": 12},
]

for item in equipamentos_ativos:
    parcela = item.get("custo_10x") or item.get("custo_12x")
    for i in range(item["parcelas"]):
        parcelamentos[i] += parcela

# Tabela de fluxo de caixa
tabela = defaultdict(list)

for mes in range(meses_total):
    # Receita mensal por plano
    receita_mensal = 0
    clientes_acumulados = min((mes + 1) * clientes_mensal, numero_clientes)
    for plano, percentual in planos_percentuais.items():
        clientes_plano = int(clientes_acumulados * percentual)
        receita_mensal += clientes_plano * precos_planos[plano]

    # Receita com taxa de instalação
    receita_instalacao = clientes_mensal * taxa_instalacao

    # Custo com ONU por novo cliente
    custo_onus_mes = clientes_mensal * custo_onu

    # Custos fixos e parcelas
    custo_mensal = custo_mensal_alugueis + parcelamentos.get(mes, 0)
    # Adiciona custo de instalação residencial sob demanda
    custo_instalacao_residencial = custo_mao_obra_residencial_mensal
    custo_mensal_total = custo_mensal + custo_instalacao_residencial

    # Lucro líquido operacional (sem descontar investimentos)
    # Descontar também o custo PON do mês
    custo_pon_mes = custo_pon_inicial if mes == 0 else 0
    lucro = receita_mensal + receita_instalacao - custo_onus_mes - custo_mensal_total - custo_pon_mes

    # Preenche tabela
    tabela["Custo Inicial"].append(investimento_inicial if mes == 0 else 0)
    tabela["Custos PON"].append(custo_pon_inicial if mes == 0 else 0)
    tabela["Custo Mão Obra"].append(custo_mao_obra_inicial if mes == 0 else 0)
    tabela["Custo Instalação"].append(custo_instalacao_residencial)
    tabela["Receita Planos"].append(receita_mensal)
    tabela["Receita Instalação"].append(receita_instalacao)
    tabela["Custo ONUs"].append(custo_onus_mes)
    tabela["Custos Fixos"].append(custo_mensal)
    tabela["Lucro Líquido"].append(lucro)

# Criar DataFrame
df = pd.DataFrame(tabela)
df.columns = pd.MultiIndex.from_product([["Valores (R$)"], df.columns])
df.index = [f"M{mes+1}" for mes in range(meses_total)]

# Ajustar o Lucro Líquido do primeiro mês para descontar os investimentos (sem afetar custos fixos)
df.iloc[0, df.columns.get_loc(("Valores (R$)", "Lucro Líquido"))] -= (
    df.iloc[0, df.columns.get_loc(("Valores (R$)", "Custo Inicial"))]
    + df.iloc[0, df.columns.get_loc(("Valores (R$)", "Custos PON"))]
    + df.iloc[0, df.columns.get_loc(("Valores (R$)", "Custo Mão Obra"))]
)

# Unir as colunas 'Mão de Obra Inicial' e 'Custo Instalação Residencial' em 'Mão de Obra'
df[('Valores (R$)', 'Mão de Obra')] = df[('Valores (R$)', 'Custo Mão Obra')] + df[('Valores (R$)', 'Custo Instalação')]
df = df.drop(columns=[('Valores (R$)', 'Custo Mão Obra'), ('Valores (R$)', 'Custo Instalação')])

# Adicionar custo de manutenção de R$ 10.000 a cada 12 meses na coluna 'Custos PON'
for i in range(11, len(df), 12):  # 11 porque o índice começa em 0 (M12, M24, ...)
    df.iloc[i, df.columns.get_loc(("Valores (R$)", "Custos PON"))] += 10000

# Corrigir o Lucro Líquido para subtrair o valor de 'Custos PON' de cada mês
df[('Valores (R$)', 'Lucro Líquido')] = df[('Valores (R$)', 'Lucro Líquido')] - df[('Valores (R$)', 'Custos PON')]

# Adicionar coluna de saldo acumulado (fluxo de caixa acumulado)
df[('Valores (R$)', 'Saldo Acumulado')] = df[('Valores (R$)', 'Lucro Líquido')].cumsum()

print(df.head(24))

# --- Plot do fluxo de caixa dos 10 anos ---
fig, axes = plt.subplots(2, 1, figsize=(16, 10), sharex=True)
meses = range(1, len(df) + 1)

# Receitas
colunas_receita = ["Receita Planos", "Receita Instalação"]
for coluna in colunas_receita:
    if ("Valores (R$)", coluna) in df.columns:
        axes[0].plot(meses, df[("Valores (R$)", coluna)], label=coluna, marker='o')
axes[0].set_ylabel("R$ (Receitas)")
axes[0].set_title("Receitas ao longo do tempo")
axes[0].legend()
axes[0].grid(True, linestyle='--', alpha=0.5)

# Despesas
colunas_despesa = ["Custos Fixos", "Custo ONUs", "Custos PON", "Custo Inicial", "Mão de Obra"]
import matplotlib.ticker as mticker

for coluna in colunas_despesa:
    if ("Valores (R$)", coluna) in df.columns:
        # Linha principal
        axes[1].plot(meses, df[("Valores (R$)", coluna)], label=coluna, linewidth=2, color=None)
        # Pontos destacados
        axes[1].scatter(meses, df[("Valores (R$)", coluna)], s=40, marker='o')
axes[1].set_xlabel("Meses")
axes[1].set_ylabel("R$ (Despesas)")
axes[1].set_title("Despesas ao longo do tempo")
axes[1].legend()
axes[1].grid(True, linestyle='--', alpha=0.5)
axes[1].yaxis.set_major_formatter(mticker.StrMethodFormatter('{x:,.0f}'))

plt.tight_layout()
plt.savefig("fluxo_caixa_receitas_despesas.svg")

# --- Indicadores de Viabilidade Econômica ---
import numpy as np
import numpy_financial as npf

tma_ano = 0.15  # 15% a.a.
tma_mes = (1 + tma_ano) ** (1/12) - 1  # converter para taxa mensal

# Fluxo de caixa mensal (lucro líquido)
fluxo_caixa = df[("Valores (R$)", "Lucro Líquido")].values

# 1. Payback Time (tempo até o saldo acumulado ficar positivo)
saldo_acumulado = df[("Valores (R$)", "Saldo Acumulado")].values
payback_idx = np.argmax(saldo_acumulado >= 0)
payback_time = payback_idx + 1 if saldo_acumulado[payback_idx] >= 0 else None

# 2. VPL (Valor Presente Líquido)
periodos = np.arange(len(fluxo_caixa))
vpl = np.sum(fluxo_caixa / (1 + tma_mes) ** periodos)

# 3. TIR (Taxa Interna de Retorno)
tir = npf.irr(fluxo_caixa)

# Exibir resultados
print(f"\n--- Indicadores de Viabilidade ---")
if payback_time:
    print(f"Payback: {payback_time} meses")
else:
    print("Payback: Não atingido em 10 anos")
print(f"VPL (a 15% a.a.): R$ {vpl:,.2f}")
print(f"TIR: {tir*100:.2f}% ao mês ou {(1+tir)**12-1:.2%} ao ano")

# --- Gráfico de Viabilidade ---
plt.figure(figsize=(12,6))
import matplotlib.ticker as mticker
plt.bar(meses, saldo_acumulado, label="Saldo Acumulado", color="royalblue")
if payback_time:
    plt.axvline(payback_time, color="green", linestyle="--", label=f"Payback: M{payback_time}")
plt.title(f"Viabilidade: Payback, VPL=R$ {vpl:,.2f}, TIR={(1+tir)**12-1:.2%} a.a.")
plt.xlabel("Meses")
plt.ylabel("Saldo Acumulado (R$)")
plt.gca().yaxis.set_major_formatter(mticker.StrMethodFormatter('{x:,.0f}'))
plt.legend()
plt.grid(True, linestyle='--', alpha=0.5)
plt.tight_layout()
plt.savefig("viabilidade_fluxo_caixa.svg")