# -*- coding: utf-8 -*-

def lfsr(seed, taps, count):
    # Converte o seed de string binária para uma lista de inteiros
    state = [int(bit) for bit in seed]
    
    # Função para calcular o próximo bit usando os taps
    def next_bit(state, taps):
        xor = 0
        for t in taps:
            xor ^= state[t]
        return xor
    
    for _ in range(count):
        new_bit = next_bit(state, taps)  # Calcula o próximo bit
        state = [new_bit] + state[:-1]  # Desloca os bits para a direita e insere o novo bit na frente

    return state

# Parâmetros
seed = '1111111111111'
taps = [0, 2, 3, 12]
count = 5000

# Gera a sequência LFSR e captura o estado na posição 5000
final_state = lfsr(seed, taps, count)

# Converte o estado final para string e imprime
final_state_str = ''.join(map(str, final_state))
print(f"Estado do LFSR na contagem 5000: {final_state_str}")
