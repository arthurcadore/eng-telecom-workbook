import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve
import warnings
warnings.filterwarnings('ignore')

# Configuração para plots
plt.style.use('default')
plt.rcParams['figure.figsize'] = (12, 8)
plt.rcParams['font.size'] = 12

def calcular_vpl(fluxo_caixa, taxa):
    """
    Calcula o Valor Presente Líquido (VPL)
    
    Args:
        fluxo_caixa: lista com os fluxos de caixa (investimento inicial negativo)
        taxa: taxa de desconto em decimal
    
    Returns:
        VPL calculado
    """
    vpl = 0
    for i, fluxo in enumerate(fluxo_caixa):
        vpl += fluxo / ((1 + taxa) ** i)
    return vpl

def calcular_tir(fluxo_caixa, taxa_inicial=0.1):
    """
    Calcula a Taxa Interna de Retorno (TIR)
    
    Args:
        fluxo_caixa: lista com os fluxos de caixa
        taxa_inicial: taxa inicial para o método de Newton
    
    Returns:
        TIR calculada
    """
    def funcao_vpl(taxa):
        return calcular_vpl(fluxo_caixa, taxa)
    
    try:
        tir = fsolve(funcao_vpl, taxa_inicial)[0]
        return tir
    except:
        return None

def converter_taxa(taxa_origem, periodo_origem, periodo_destino):
    """
    Converte taxa de um período para outro
    
    Args:
        taxa_origem: taxa original em decimal
        periodo_origem: período original (ex: 12 para anual, 1 para mensal)
        periodo_destino: período de destino
    
    Returns:
        Taxa convertida
    """
    return (1 + taxa_origem) ** (periodo_destino / periodo_origem) - 1

print("=== SOLUÇÕES - LISTA DE EXERCÍCIOS ECONOMIA ===\n")

# Questão 1
print("QUESTÃO 1:")
print("Central de geração de energia")
print("- Investimento inicial: R$ 10.000.000,00")
print("- Renda anual: R$ 1.500.000,00 por 20 anos")
print("- TMA: 12% a.a.")

investimento = -10000000
renda_anual = 1500000
anos = 20
tma = 0.12

# Fluxo de caixa
fluxo_caixa_1 = [investimento] + [renda_anual] * anos

# Cálculo do VPL
vpl_1 = calcular_vpl(fluxo_caixa_1, tma)

# Cálculo da TIR
tir_1 = calcular_tir(fluxo_caixa_1)

print(f"VPL: R$ {vpl_1:,.2f}")
if tir_1 is not None:
    print(f"TIR: {tir_1*100:.2f}% a.a.")
    print(f"Decisão: {'ACEITAR' if vpl_1 > 0 else 'REJEITAR'} (VPL > 0)")
    print(f"Decisão: {'ACEITAR' if tir_1 > tma else 'REJEITAR'} (TIR > TMA)")
else:
    print("TIR: Não foi possível calcular")
    print(f"Decisão: {'ACEITAR' if vpl_1 > 0 else 'REJEITAR'} (VPL > 0)")
print()

# Questão 2
print("QUESTÃO 2:")
print("Comparação de taxas de aplicação")

# Item (a): 40% a.a. com capitalização mensal
taxa_a_anual = 0.40
taxa_a_mensal = converter_taxa(taxa_a_anual, 12, 1)

# Item (b): 1% a.m. com correção monetária de 3% a.t.
taxa_b_mensal = 0.01
correcao_trimestral = 0.03
taxa_b_mensal_corrigida = (1 + taxa_b_mensal) * (1 + correcao_trimestral/3) - 1

print(f"Item (a): {taxa_a_anual*100:.1f}% a.a. com capitalização mensal")
print(f"  Taxa mensal equivalente: {taxa_a_mensal*100:.4f}% a.m.")
print(f"Item (b): {taxa_b_mensal*100:.1f}% a.m. + {correcao_trimestral*100:.1f}% a.t. de correção")
print(f"  Taxa mensal corrigida: {taxa_b_mensal_corrigida*100:.4f}% a.m.")
print(f"Melhor opção: {'Item (a)' if taxa_a_mensal > taxa_b_mensal_corrigida else 'Item (b)'}")
print()

# Questão 3
print("QUESTÃO 3:")
print("Investimento em ações")

investimento_acoes = 1000
dividendo_3mes = 50
dividendo_6mes = 75
venda_9mes = 1150
tarifa = 7
cdi_anual = 0.12  # Assumindo CDI de 12% a.a.
cdi_mensal = converter_taxa(cdi_anual, 12, 1)

# Fluxo de caixa
fluxo_caixa_3 = [
    -(investimento_acoes + tarifa),  # Compra + tarifa
    0, 0, dividendo_3mes,  # Meses 1, 2, 3
    0, 0, dividendo_6mes,  # Meses 4, 5, 6
    0, 0, venda_9mes - tarifa  # Meses 7, 8, 9 (venda - tarifa)
]

vpl_3 = calcular_vpl(fluxo_caixa_3, cdi_mensal)
tir_3 = calcular_tir(fluxo_caixa_3)

print(f"Investimento inicial: R$ {investimento_acoes + tarifa:.2f}")
print(f"Recebimentos: R$ {dividendo_3mes + dividendo_6mes + venda_9mes - tarifa:.2f}")
print(f"VPL (CDI): R$ {vpl_3:.2f}")
if tir_3 is not None:
    print(f"TIR: {tir_3*100:.2f}% a.m. ({tir_3*12*100:.2f}% a.a.)")
else:
    print("TIR: Não foi possível calcular")
print(f"Investimento {'vantajoso' if vpl_3 > 0 else 'não vantajoso'}")
print()

# Questão 4
print("QUESTÃO 4:")
print("Refinanciamento de dívida")

divida_total = 10000000
parcelas_220k = 6
parcelas_440k = 6
parcelas_880k = 8
tma_credor = 0.104

# Fluxo de caixa para o credor
fluxo_caixa_4 = [divida_total]  # Recebimento inicial
fluxo_caixa_4.extend([-220000] * parcelas_220k)  # 6 parcelas de 220k
fluxo_caixa_4.extend([-440000] * parcelas_440k)  # 6 parcelas de 440k
fluxo_caixa_4.extend([-880000] * parcelas_880k)  # 8 parcelas de 880k

tir_4 = calcular_tir(fluxo_caixa_4)
vpl_4 = calcular_vpl(fluxo_caixa_4, tma_credor)

print(f"Dívida total: R$ {divida_total:,.0f}")
print(f"Parcelas: 6x R$ 220k + 6x R$ 440k + 8x R$ 880k")
if tir_4 is not None:
    print(f"TIR: {tir_4*100:.2f}% a.s. ({tir_4*2*100:.2f}% a.a.)")
else:
    print("TIR: Não foi possível calcular")
print(f"VPL (TMA {tma_credor*100:.1f}% a.a.): R$ {vpl_4:,.2f}")
print(f"Operação {'vantajosa' if vpl_4 > 0 else 'não vantajosa'} para o credor")
print()

# Questão 5
print("QUESTÃO 5:")
print("Opções para aquisição de carro comercial")

# Parâmetros
km_mes = 3000
reembolso_km = 0.55
reembolso_mensal = km_mes * reembolso_km
taxa_juros = 0.12
taxa_mensal = converter_taxa(taxa_juros, 12, 1)
periodo = 36
valor_venda = 7500

# Opção A: Compra à vista
preco_vista = 26000
fluxo_a = [-preco_vista] + [reembolso_mensal] * periodo
fluxo_a[-1] += valor_venda  # Adiciona valor de venda no último mês
vpl_a = calcular_vpl(fluxo_a, taxa_mensal)

# Opção B: Leasing
pagamento_leasing = 700
fluxo_b = [0] + [-pagamento_leasing + reembolso_mensal] * periodo
vpl_b = calcular_vpl(fluxo_b, taxa_mensal)

# Opção C: Leasing com opção de compra
pagamento_leasing_opcao = 720
valor_compra_final = 7000
fluxo_c = [0] + [-pagamento_leasing_opcao + reembolso_mensal] * periodo
fluxo_c[-1] = -pagamento_leasing_opcao + reembolso_mensal - valor_compra_final + valor_venda
vpl_c = calcular_vpl(fluxo_c, taxa_mensal)

print(f"Reembolso mensal: R$ {reembolso_mensal:.2f}")
print(f"Taxa mensal: {taxa_mensal*100:.2f}%")
print()
print("Opção A (Compra à vista):")
print(f"  VPL: R$ {vpl_a:,.2f}")
print("Opção B (Leasing):")
print(f"  VPL: R$ {vpl_b:,.2f}")
print("Opção C (Leasing com opção de compra):")
print(f"  VPL: R$ {vpl_c:,.2f}")
print()

melhor_opcao = max([(vpl_a, "A"), (vpl_b, "B"), (vpl_c, "C")])
print(f"Melhor opção: {melhor_opcao[1]} (VPL: R$ {melhor_opcao[0]:,.2f})")
print()

# Questão 6
print("QUESTÃO 6:")
print("Ampliação de instalações")

investimento_ampliacao = 500000
aumento_lucro_anual = 125000
periodo_uso = 48  # meses
periodo_anos = periodo_uso / 12
tma_empresa = 0.12

fluxo_caixa_6 = [-investimento_ampliacao]
for i in range(int(periodo_anos)):
    fluxo_caixa_6.append(aumento_lucro_anual)

vpl_6 = calcular_vpl(fluxo_caixa_6, tma_empresa)
tir_6 = calcular_tir(fluxo_caixa_6)

print(f"Investimento: R$ {investimento_ampliacao:,.0f}")
print(f"Aumento de lucro anual: R$ {aumento_lucro_anual:,.0f}")
print(f"Período de uso: {periodo_anos:.0f} anos")
print(f"TMA: {tma_empresa*100:.1f}% a.a.")
print(f"VPL: R$ {vpl_6:,.2f}")
if tir_6 is not None:
    print(f"TIR: {tir_6*100:.2f}% a.a.")
else:
    print("TIR: Não foi possível calcular")
print(f"Investimento {'vale a pena' if vpl_6 > 0 else 'não vale a pena'}")
print()

# Questão 7
print("QUESTÃO 7:")
print("Lançamento de novo produto de software")

custo_capital = 0.09
investimento_inicial = 2550

# Fluxo de caixa (em milhares)
fluxo_caixa_7 = [-investimento_inicial, 355, 430, 560, 745, 735, 810, 900]

vpl_7 = calcular_vpl(fluxo_caixa_7, custo_capital)
tir_7 = calcular_tir(fluxo_caixa_7)

print(f"Investimento inicial: R$ {investimento_inicial:,.2f}")
print(f"Custo de capital: {custo_capital*100:.1f}% a.a.")
print("Fluxo de caixa anual:")
for i, fluxo in enumerate(fluxo_caixa_7[1:], 1):
    print(f"  Ano {i}: R$ {fluxo:,.2f}")
print(f"VPL: R$ {vpl_7:,.2f}")
if tir_7 is not None:
    print(f"TIR: {tir_7*100:.2f}% a.a.")
else:
    print("TIR: Não foi possível calcular")
print(f"Projeto {'aceito' if vpl_7 > 0 else 'rejeitado'}")

print("\n=== RESUMO DAS DECISÕES ===")
print("Q1: Central de energia - ACEITAR" if vpl_1 > 0 else "Q1: Central de energia - REJEITAR")
print("Q2: Melhor taxa - Item A" if taxa_a_mensal > taxa_b_mensal_corrigida else "Q2: Melhor taxa - Item B")
print("Q3: Investimento em ações - Vantajoso" if vpl_3 > 0 else "Q3: Investimento em ações - Não vantajoso")
print("Q4: Refinanciamento - Vantajoso para credor" if vpl_4 > 0 else "Q4: Refinanciamento - Não vantajoso para credor")
print(f"Q5: Melhor opção carro - Opção {melhor_opcao[1]}")
print("Q6: Ampliação instalações - Vale a pena" if vpl_6 > 0 else "Q6: Ampliação instalações - Não vale a pena")
print("Q7: Novo produto software - Aceito" if vpl_7 > 0 else "Q7: Novo produto software - Rejeitado") 