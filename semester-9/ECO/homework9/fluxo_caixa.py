from collections import defaultdict
import pandas as pd

# Configurações
anos = 10
meses_total = anos * 12
clientes_mensal = 30
investimento_inicial = 50000

# Distribuição de planos por cliente
planos_percentuais = {
    "100Mbps": 0.70,
    "200Mbps": 0.20,
    "500Mbps": 0.10
}

# Preço mensal dos planos
precos_planos = {
    "100Mbps": 100,
    "200Mbps": 150,
    "500Mbps": 200,
}

# Receita taxa de instalação por novo cliente
taxa_instalacao = 100

# Custo da ONU por cliente
custo_onu = 88

# Aluguéis fixos mensais
alugueis = [
    {"nome": "POP - Ponto de Presença", "custo_mensal": 2000, "quantidade": 1},
    {"nome": "Poste", "custo_mensal": 6, "quantidade": 338},
    {"nome": "Uplink", "custo_mensal": 5000, "quantidade": 1}
]
custo_mensal_alugueis = sum(x["custo_mensal"] * x["quantidade"] for x in alugueis)

# Equipamentos passivos para instalação de fibra
equipamentos_passivos = [
    {"nome": "Rack de telecomunicações 10U", "custo_Vista": 1000, "quantidade": 1},
    {"nome": "DIO 12x2", "custo_Vista": 100, "quantidade": 10},
    {"nome": "Splitter 1x16", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Splitter Desbalanceado 10/90", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Splitter Desbalanceado 20/80", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Splitter Desbalanceado 30/70", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Splitter Desbalanceado 40/60", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Conector SC/APC", "custo_Vista": 1.5, "quantidade": 1280},
    {"nome": "Patch-cord fibra óptica 1 metro", "custo_Vista": 5, "quantidade": 1280},
]

# Equipamentos de lançamento para instalação de fibra
equipamentos_lancamento = [
    {"nome": "Mini-RA 12FO", "custo_Vista": 100, "quantidade": 10},
    {"nome": "Mini-RA 6FO", "custo_Vista": 50, "quantidade": 10},
    {"nome": "Drop 1FO", "custo_Vista": 10, "quantidade": 1280},
    {"nome": "Caixa de emenda - Fusão", "custo_Vista": 200, "quantidade": 10},
    {"nome": "Caixa de emenda - Conectorizada", "custo_Vista": 200, "quantidade": 10},
    {"nome": "Caixa de terminação", "custo_Vista": 100, "quantidade": 10},
    {"nome": "Abraçadeira-BAP-3", "custo_Vista": 0.5, "quantidade": 1280},
    {"nome": "Isolador BAP-3", "custo_Vista": 0.1, "quantidade": 1280},
    {"nome": "Alça Preformada", "custo_Vista": 0.5, "quantidade": 1280}
]

# Cálculo do custo total dos equipamentos passivos e de lançamento
custo_passivos = sum(item["custo_Vista"] * item["quantidade"] for item in equipamentos_passivos)
custo_lancamento = sum(item["custo_Vista"] * item["quantidade"] for item in equipamentos_lancamento)
custo_pon_inicial = custo_passivos + custo_lancamento

# Lista completa de mão de obra
mao_de_obra = [
    {"nome": "Instalação POP", "custo": 10000, "quantidade": 1},
    {"nome": "Instalação Residencial", "custo": 300, "quantidade": 1280},
    {"nome": "Instalação Infraestrutura PON", "custo": 1, "quantidade": 10000},
    {"nome": "Fusões", "custo": 1, "quantidade": 1000},
]
# Custos iniciais de mão de obra (apenas POP, Infraestrutura PON e Fusões)
custo_mao_obra_inicial = sum(
    item["custo"] * item["quantidade"]
    for item in mao_de_obra
    if item["nome"] in ["Instalação POP", "Instalação Infraestrutura PON", "Fusões"]
)
# Custo mensal de instalação residencial (30 clientes/mês, R$ 50 por cliente)
custo_mao_obra_residencial_mensal = 30 * 300

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
    clientes_acumulados = (mes + 1) * clientes_mensal
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
    lucro = receita_mensal + receita_instalacao - custo_onus_mes - custo_mensal_total

    # Preenche tabela
    tabela["Investimento Inicial"].append(investimento_inicial if mes == 0 else 0)
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
    df.iloc[0, df.columns.get_loc(("Valores (R$)", "Investimento Inicial"))]
    + df.iloc[0, df.columns.get_loc(("Valores (R$)", "Custos PON"))]
    + df.iloc[0, df.columns.get_loc(("Valores (R$)", "Custo Mão Obra"))]
)

# Unir as colunas 'Mão de Obra Inicial' e 'Custo Instalação Residencial' em 'Mão de Obra'
df[('Valores (R$)', 'Mão de Obra')] = df[('Valores (R$)', 'Custo Mão Obra')] + df[('Valores (R$)', 'Custo Instalação')]
df = df.drop(columns=[('Valores (R$)', 'Custo Mão Obra'), ('Valores (R$)', 'Custo Instalação')])

print(df.head(24))