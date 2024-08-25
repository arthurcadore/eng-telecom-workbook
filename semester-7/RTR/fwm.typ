#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Calculo de sobreposição de espectro",
  subtitle: "Redes de Transmissão",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "25 de Agosto de 2024",
  doc,
)

= Introdução: 

= Frequências utilizadas: 

== Comprimentos de entrada:
$
lambda_1 - 1528,77 "nm"
$$
lambda_2 - 1529,55 "nm"
$$
lambda_3 - 1530,33 "nm"
$$
lambda_4 - 1531,12 "nm"
$

== Conversão para frequência: 

Considerando a velocidade da luz como 299.792.458 m/s, temos como que a frequência de cada uma das ondas é dada por:

$
F_1 = (299792458) / (1528.77 * 10^-9) = 196100432373738,3 "ou" 196,1004323737383 "THz"
$

$
F_2 = (299792458) / (1529.55 * 10^-9) = 196000430191886,5 "ou" 196,0004301918865 "THz"
$

$
F_3 = (299792458) / (1530.33 * 10^-9) = 195900529951056,3 "ou" 195,9005299510563 "THz"
$

$
F_4 = (299792458) / (1531.12 * 10^-9) = 195799452688228,2 "ou" 195,7994526882282 "THz"
$

= Alterando o script python: 

== Script original:

#sourcecode[```python
# IFSC Câmpus São José
# Engenharia de Telecomunicações
# RTR029007 Redes de Transmissão
# Professor: Fábio Alexandre de Souza
# Four Wave Mixing

import os
import itertools

print('===========================Inicio======================')
print('Ff = fi + fj - fk, onde i dif k e j dif k')

n = int(input('Digite n: '))

canais = list()

for cont in range(0,n):
   canais.append(float(input('Digite f em THz: ')))
c = 0;

print('==========================Arranjos=====================')

for f in itertools.product(range(0, n), repeat=3):
   if f[0] != f[2] and f[1] != f[2]:
      c = c+1
      print('\nArranjo ',c, '=','[',canais[f[0]], canais[f[1]], canais[f[2]],']')
      Ff = canais[f[0]] + canais[f[1]] - canais[f[2]]
      print('Ff = ', round(Ff,2))
      if Ff in canais:
          print("Sobreposição!")
numar = c
print('número de conjuntos = ',numar)

print('========================================================')
print('====================FIM========================')
```]

== Adição do calculo de sobreposição: 

#sourcecode[```python
# Função para verificar sobreposição com tolerância
def verificar_sobreposicao(canais, resultados, tolerancia=0.000435):
    sobreposicoes = []
    canais_set = set(canais) 
    for f, arranjo in resultados:
        for canal in canais:
            if abs(f - canal) <= tolerancia:
                sobreposicoes.append((arranjo, f, canal))
                break 
    return sobreposicoes
```] 

== Código final:

#sourcecode[```python
# IFSC Câmpus São José
# Engenharia de Telecomunicações
# RTR029007 Redes de Transmissão
# Professor: Fábio Alexandre de Souza
# Four Wave Mixing

import os
import itertools

# Entradas
n = 4

canais = [ 
        196.1004323737383,
        196.0004301918865,
        195.9005299510563,
        195.7994526882282
]

# Autor: Arthur Cadore M. Barcella
# Função para verificar sobreposição com tolerância
def verificar_sobreposicao(canais, resultados, tolerancia=0.000435):
    sobreposicoes = []
    canais_set = set(canais) 
    for f, arranjo in resultados:
        for canal in canais:
            if abs(f - canal) <= tolerancia:
                sobreposicoes.append((arranjo, f, canal))
                break 
    return sobreposicoes

# Arranjos
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

# Verificar sobreposição
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
```]