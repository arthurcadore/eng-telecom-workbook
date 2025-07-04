import numpy as np
from scipy.optimize import fsolve
import warnings

warnings.filterwarnings('ignore')

def calcular_vpl_manual(taxa, fluxo_caixa):
    """Calcula o VPL iterando manualmente sobre o fluxo de caixa."""
    vpl = 0
    # O primeiro elemento é o investimento inicial no tempo 0
    investimento_inicial = fluxo_caixa[0]
    # O VPL é calculado sobre os fluxos futuros (a partir do período 1)
    for t, valor in enumerate(fluxo_caixa[1:], start=1):
        vpl += valor / (1 + taxa)**t
    return investimento_inicial + vpl

def calcular_tir_manual(fluxo_caixa, taxa_inicial=0.1):
    """Encontra a TIR usando fsolve com a função de VPL manual."""
    def vpl_para_tir(taxa):
        return calcular_vpl_manual(taxa, fluxo_caixa)
    try:
        return fsolve(vpl_para_tir, taxa_inicial)[0]
    except:
        return None

# --- Questão 1 ---
print("=== QUESTÃO 1 ===")
tma_1 = 0.10
horizonte = 24

# Alternativa A
fluxo_a = np.zeros(horizonte + 1)
fluxo_a[0] = -300000
for ano in range(1, horizonte + 1):
    fluxo_a[ano] -= 10000 # Custo reparo
    if ano % 8 == 0 and ano != horizonte:
        fluxo_a[ano] -= 150000 # Custo re-pavimentação
vpl_a = calcular_vpl_manual(tma_1, fluxo_a)
print(f"VPL Alternativa A: R$ {vpl_a:,.2f}")

# Alternativa B
fluxo_b = np.zeros(horizonte + 1)
fluxo_b[0] = -200000
for ano in range(1, horizonte + 1):
    fluxo_b[ano] -= 12000 # Custo reparo
    if ano % 6 == 0 and ano != horizonte:
        fluxo_b[ano] -= 120000 # Custo re-pavimentação
vpl_b = calcular_vpl_manual(tma_1, fluxo_b)
print(f"VPL Alternativa B: R$ {vpl_b:,.2f}")
print(f"Melhor opção (menor custo): {'A' if vpl_a > vpl_b else 'B'}")
print()

# --- Questão 2 ---
print("=== QUESTÃO 2 ===")
fluxo_a_2 = np.zeros(horizonte + 1)
fluxo_a_2[0] = -300000
for ano in range(1, horizonte + 1):
    fluxo_a_2[ano] -= 800 + (ano - 1) * 800 # Gradiente aritmético
    if ano % 8 == 0 and ano != horizonte:
        fluxo_a_2[ano] -= 150000
vpl_a_2 = calcular_vpl_manual(tma_1, fluxo_a_2)
print(f"VPL Alternativa A (custos crescentes): R$ {vpl_a_2:,.2f}")
print(f"VPL Alternativa B (mesmo da Q1): R$ {vpl_b:,.2f}")
print(f"Melhor opção (menor custo): {'A' if vpl_a_2 > vpl_b else 'B'}")
print()

# --- Questão 3 ---
print("=== QUESTÃO 3 ===")
tma_3 = 0.10
anos_concessao = 18

fluxo_custos = np.zeros(anos_concessao + 1)
fluxo_custos[0] = -60000000
for ano in range(1, anos_concessao + 1):
    fluxo_custos[ano] = -(100000 * (1.03)**(ano-1))
vpl_custos = calcular_vpl_manual(tma_3, fluxo_custos)

def calcular_vpl_receitas(fluxo_veiculos_inicial):
    fluxo_receitas = np.zeros(anos_concessao + 1)
    for ano in range(1, anos_concessao + 1):
        fluxo_receitas[ano] = (fluxo_veiculos_inicial * (1.05)**(ano - 1) * 100)
    return calcular_vpl_manual(tma_3, fluxo_receitas)

def equacao_vpl_zero(x):
    return vpl_custos + calcular_vpl_receitas(x[0])

fluxo_minimo_veiculos = fsolve(equacao_vpl_zero, x0=[1000])[0]
print(f"VPL dos Custos Totais: R$ {vpl_custos:,.2f}")
print(f"Fluxo mínimo de veículos no primeiro ano: {fluxo_minimo_veiculos:.0f}")
print()

# --- Questão 4 ---
print("=== QUESTÃO 4 ===")
tma_4 = 0.10
vida_util_4 = 25

# Cerca de Arame
fluxo_arame = np.zeros(vida_util_4 + 1)
fluxo_arame[0] = -35000
for ano in range(1, vida_util_4 + 1):
    fluxo_arame[ano] = -300
vpl_arame = calcular_vpl_manual(tma_4, fluxo_arame)

# Muro de Concreto
fluxo_concreto = np.zeros(vida_util_4 + 1)
fluxo_concreto[0] = -20000
for ano in range(1, vida_util_4 + 1):
    if ano % 10 == 0:
        fluxo_concreto[ano] -= 5000
    elif ano % 5 == 0:
        fluxo_concreto[ano] -= 1000
vpl_concreto = calcular_vpl_manual(tma_4, fluxo_concreto)

print(f"VPL Cerca de Arame: R$ {vpl_arame:,.2f}")
print(f"VPL Muro de Concreto: R$ {vpl_concreto:,.2f}")
print(f"Melhor opção (menor custo): {'Cerca de Arame' if vpl_arame > vpl_concreto else 'Muro de Concreto'}")
print()

# --- Questão 5 ---
print("=== QUESTÃO 5 ===")
tma_5 = 0.09
vida_util_gerador = 15
investimento_gerador = 30000

fluxo_gerador = np.zeros(vida_util_gerador + 1)
fluxo_gerador[0] = -investimento_gerador
receita_anual = 100000 * 0.08
manutencao_anual = 500
fluxo_anual = receita_anual - manutencao_anual
for ano in range(1, vida_util_gerador + 1):
    fluxo_gerador[ano] = fluxo_anual
fluxo_gerador[vida_util_gerador] += 2000 # Valor residual

# Payback Descontado
acumulado = 0
payback_descontado = -1
for ano in range(1, vida_util_gerador + 1):
    vp = fluxo_gerador[ano] / (1 + tma_5)**ano
    if (acumulado + vp) < investimento_gerador:
        acumulado += vp
    else:
        payback_descontado = ano - 1 + (investimento_gerador - acumulado) / vp
        break

vpl_gerador = calcular_vpl_manual(tma_5, fluxo_gerador)
tir_gerador = calcular_tir_manual(fluxo_gerador)

print(f"Payback Descontado: {payback_descontado:.2f} anos")
print(f"VPL do Gerador: R$ {vpl_gerador:,.2f}")
if tir_gerador is not None:
    print(f"TIR do Gerador: {tir_gerador*100:.2f}% a.a.")
else:
    print("TIR do Gerador: Não foi possível calcular.") 