import os
import itertools

n = 4
canais = [ 
        196.1004323737383,
        196.0004301918865,
        195.9005299510563,
        195.7994526882282
]

def verificar_sobreposicao(canais, resultados, tolerancia=0.000435):
    sobreposicoes = []
    canais_set = set(canais) 
    for f, arranjo in resultados:
        for canal in canais:
            if abs(f - canal) <= tolerancia:
                sobreposicoes.append((arranjo, f, canal))
                break 
    return sobreposicoes

resultados = []
c = 0

print('==========================Arranjos=====================')
for f in itertools.product(range(0, n), repeat=3):
    if f[0] != f[2] and f[1] != f[2]:
        c += 1
        arranjo = [canais[f[0]], canais[f[1]], canais[f[2]]]
        Ff = canais[f[0]] + canais[f[1]] - canais[f[2]]
        resultados.append((round(Ff, 2), arranjo))
        print('\nArranjo ', c, '=','[', arranjo[0], arranjo[1], arranjo[2], ']')
        print('Ff = ', round(Ff, 2))

sobreposicoes = verificar_sobreposicao(canais, resultados)
num_sobreposicoes = len(sobreposicoes)

print('==========================Sobreposições=====================')
if sobreposicoes:
    print('\nCanais com Sobreposição:')
    for arranjo, freq_calculada, freq_original in sobreposicoes:
        print(f'Arranjo {arranjo} tem sobreposição com Ff = {freq_calculada} THz (próximo de {freq_original} THz)')

print('==========================Resultados========================')
print('Número de conjuntos = ', c)
print('Número de sobreposições = ', num_sobreposicoes)

