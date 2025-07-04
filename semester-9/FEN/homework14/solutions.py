#!/usr/bin/env python3
"""
Solução para Homework 14 - Equação de Bernoulli e Perdas de Carga
Cálculo da potência da bomba
"""

import math

def calcular_potencia_bomba():
    """
    Calcula a potência da bomba usando equação de Bernoulli e perdas de carga
    """
    # Dados do problema
    Q = 14  # m³/h
    Q_si = Q / 3600  # m³/s
    eta = 0.75  # eficiência da bomba
    rho = 1000  # kg/m³ (densidade da água)
    g = 9.81  # m/s² (aceleração da gravidade)
    nu = 1.006e-6  # m²/s (viscosidade cinemática)

    # Sucção (PVC 1 1/2")
    D_suc = 0.0381  # m
    L_suc = 3 + 2  # m (vertical + horizontal)
    e_suc = 0.0000015  # rugosidade PVC liso (aprox.)
    f_suc = 0.018  # fator de atrito típico PVC

    # Recalque (Ferro fundido 2")
    D_rec = 0.0508  # m
    L_rec = 5 + 2 + 10 + 16  # m (verticais + horizontal)
    e_rec = 0.03 * D_rec  # rugosidade relativa
    f_rec = 0.03  # fator de atrito típico ferro fundido usado

    # Altura geométrica total
    H_geom = 3 + 5 + 2 + 10  # m (vertical total)

    # Acessórios
    # Sucção: 1 curva 90° (entrada), 1 curva 90° (saída), válvula de pé
    # Recalque: 4 curvas 90°, válvula de retenção, registro globo
    curvas = 6
    K_curva = 0.5  # típico curva 90°
    K_vp = 3.0  # válvula de pé
    K_vr = 2.5  # válvula de retenção
    K_rg = 10.0 # registro globo
    K_total = curvas * K_curva + K_vp + K_vr + K_rg

    # Velocidade nos tubos
    A_suc = math.pi * D_suc**2 / 4
    v_suc = Q_si / A_suc
    A_rec = math.pi * D_rec**2 / 4
    v_rec = Q_si / A_rec

    # Perdas por atrito
    Hf_suc = f_suc * (L_suc / D_suc) * (v_suc**2 / (2 * g))
    Hf_rec = f_rec * (L_rec / D_rec) * (v_rec**2 / (2 * g))
    Hf_total = Hf_suc + Hf_rec

    # Perdas localizadas
    Hl_total = K_total * (v_rec**2 / (2 * g))

    # Altura manométrica total
    H_total = H_geom + Hf_total + Hl_total

    # Potência hidráulica e da bomba
    P_hidraulica = rho * g * Q_si * H_total
    P_bomba = P_hidraulica / eta

    print(f"Vazão: {Q} m³/h = {Q_si:.6f} m³/s")
    print(f"Altura geométrica: {H_geom} m")
    print(f"Comprimento sucção: {L_suc} m, recalque: {L_rec} m")
    print(f"Diâmetro sucção: {D_suc*1000:.1f} mm, recalque: {D_rec*1000:.1f} mm")
    print(f"Velocidade sucção: {v_suc:.3f} m/s, recalque: {v_rec:.3f} m/s")
    print(f"Perdas por atrito sucção: {Hf_suc:.3f} m, recalque: {Hf_rec:.3f} m, total: {Hf_total:.3f} m")
    print(f"Perdas localizadas: {Hl_total:.3f} m")
    print(f"Altura manométrica total: {H_total:.3f} m")
    print(f"Potência hidráulica: {P_hidraulica:.1f} W")
    print(f"Potência da bomba: {P_bomba:.1f} W")
    return P_bomba

if __name__ == "__main__":
    potencia = calcular_potencia_bomba()
    print(f"\n=== RESPOSTA FINAL ===")
    print(f"A potência da bomba é: {potencia:.1f} W") 