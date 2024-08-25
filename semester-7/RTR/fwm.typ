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

O objetivo deste relatório é realizar o cálculo de sobreposição de espectro utilizando o script python fornecido pelo professor, verificando quais canais possuem sobreposição e quais são as frequências que estão próximas.

= Frequências utilizadas: 

Para o calculo de sobreposição, é necessário primeiramento obter as frequências de cada um dos canais. Para isso, é necessário converter os comprimentos de onda fornecidos em frequência.

== Comprimentos de entrada:

Os comprimentos de onda fornecidos para verificação são os seguintes: 

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

Para verificar a sobreposição de espectro, é necessário utilizar um script para verificar se a frequência calculada está próxima de alguma das frequências originais.

== Script original:

Foi fornecido um script base como referência passado pelo professor para verificação de sobreposição de espectro. O mesmo está apresentado abaixo: 

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

No script, foi adicionado uam função para verificar a sobreposição de espectro, que verifica se a frequência calculada está próxima de alguma das frequências originais: 

#sourcecode[```python
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
```] 

== Código final:

Uma vez editado, o código final para verificação de sobreposição de espectro é o seguinte, além de adicionar a função de verificação de sobreposição, outras alterações foram realizadas: 

#sourcecode[```python
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
```]

= Resultados: 

Uma vez com o script finalizado, é possível realizar a execução do mesmo para verificar a sobreposição de espectro. Para isso, devemos considerar um valor de tolerância a ser utilizado para decidir se o canal está ou não sobrepondo um outro canal.

== Tolerância de 0.000435 THz

Utilizando a tolerância de 0.000435 THz, temos os seguintes resultados:

=== Arranjos:

Foram obtidos os seguintes arranjos: 

#sourcecode[```conf
Arranjo 1 = [ 196.100432373 196.100432373 196.000430191 ] -> Ff =  196.2
Arranjo 2 = [ 196.100432373 196.100432373 195.900529951 ] -> Ff =  196.3
Arranjo 3 = [ 196.100432373 196.100432373 195.799452688 ] -> Ff =  196.4
Arranjo 4 = [ 196.100432373 196.000430191 195.900529951 ] -> Ff =  196.2
Arranjo 5 = [ 196.100432373 196.000430191 195.799452688 ] -> Ff =  196.3
Arranjo 6 = [ 196.100432373 195.900529951 196.000430191 ] -> Ff =  196.0
Arranjo 7 = [ 196.100432373 195.900529951 195.799452688 ] -> Ff =  196.2
Arranjo 8 = [ 196.100432373 195.799452688 196.000430191 ] -> Ff =  195.9
Arranjo 9 = [ 196.100432373 195.799452688 195.900529951 ] -> Ff =  196.0
Arranjo 10 = [ 196.000430191 196.100432373 195.900529951 ] -> Ff =  196.2
Arranjo 11 = [ 196.000430191 196.100432373 195.799452688 ] -> Ff =  196.3
Arranjo 12 = [ 196.000430191 196.000430191 196.100432373 ] -> Ff =  195.9
Arranjo 13 = [ 196.000430191 196.000430191 195.900529951 ] -> Ff =  196.1
Arranjo 14 = [ 196.000430191 196.000430191 195.799452688 ] -> Ff =  196.2
Arranjo 15 = [ 196.000430191 195.900529951 196.100432373 ] -> Ff =  195.8
Arranjo 16 = [ 196.000430191 195.900529951 195.799452688 ] -> Ff =  196.1
Arranjo 17 = [ 196.000430191 195.799452688 196.100432373 ] -> Ff =  195.7
Arranjo 18 = [ 196.000430191 195.799452688 195.900529951 ] -> Ff =  195.9
Arranjo 19 = [ 195.900529951 196.100432373 196.000430191 ] -> Ff =  196.0
Arranjo 20 = [ 195.900529951 196.100432373 195.799452688 ] -> Ff =  196.2
Arranjo 21 = [ 195.900529951 196.000430191 196.100432373 ] -> Ff =  195.8
Arranjo 22 = [ 195.900529951 196.000430191 195.799452688 ] -> Ff =  196.1
Arranjo 23 = [ 195.900529951 195.900529951 196.100432373 ] -> Ff =  195.7
Arranjo 24 = [ 195.900529951 195.900529951 196.000430191 ] -> Ff =  195.8
Arranjo 25 = [ 195.900529951 195.900529951 195.799452688 ] -> Ff =  196.0
Arranjo 26 = [ 195.900529951 195.799452688 196.100432373 ] -> Ff =  195.6
Arranjo 27 = [ 195.900529951 195.799452688 196.000430191 ] -> Ff =  195.7
Arranjo 28 = [ 195.799452688 196.100432373 196.000430191 ] -> Ff =  195.9
Arranjo 29 = [ 195.799452688 196.100432373 195.900529951 ] -> Ff =  196.0
Arranjo 30 = [ 195.799452688 196.000430191 196.100432373 ] -> Ff =  195.7
Arranjo 31 = [ 195.799452688 196.000430191 195.900529951 ] -> Ff =  195.9
Arranjo 32 = [ 195.799452688 195.900529951 196.100432373 ] -> Ff =  195.6
Arranjo 33 = [ 195.799452688 195.900529951 196.000430191 ] -> Ff =  195.7
Arranjo 34 = [ 195.799452688 195.799452688 196.100432373 ] -> Ff =  195.5
Arranjo 35 = [ 195.799452688 195.799452688 196.000430191 ] -> Ff =  195.6
Arranjo 36 = [ 195.799452688 195.799452688 195.900529951 ] -> Ff =  195.7
```]

=== Sobreposições: 

A partir dos arranjos obtidos, foram verificadas as sobreposições coms as frequências de entrada, que são as seguintes:

#sourcecode[```conf
Arranjo [196.100432373, 195.900529951, 196.000430191] -> Sobreposição com Ff = 196.0 (Próximo de: 196.000430191 THz)
Arranjo [196.100432373, 195.799452688, 195.900529951] -> Sobreposição com Ff = 196.0 (Próximo de: 196.000430191 THz)
Arranjo [196.000430191, 196.000430191, 195.900529951] -> Sobreposição com Ff = 196.1 (Próximo de: 196.100432373 THz)
Arranjo [196.000430191, 195.900529951, 195.799452688] -> Sobreposição com Ff = 196.1 (Próximo de: 196.100432373 THz)
Arranjo [195.900529951, 196.100432373, 196.000430191] -> Sobreposição com Ff = 196.0 (Próximo de: 196.000430191 THz)
Arranjo [195.900529951, 196.000430191, 195.799452688] -> Sobreposição com Ff = 196.1 (Próximo de: 196.100432373 THz)
Arranjo [195.900529951, 195.900529951, 195.799452688] -> Sobreposição com Ff = 196.0 (Próximo de: 196.000430191 THz)
Arranjo [195.799452688, 196.100432373, 195.900529951] -> Sobreposição com Ff = 196.0 (Próximo de: 196.000430191 THz)
```]

=== Resultados: 

Com os resultados obtidos, temos que:

#sourcecode[```conf
Número de conjuntos =  36
Número de sobreposições =  8
```]

== Tolerância de 0.00435 THz

Utilizando a tolerância de 0.00435 THz, temos os seguintes resultados:

=== Arranjos:

Foram obtidos os seguintes arranjos:

#sourcecode[```conf
Arranjo 1 = [ 196.100432373 196.100432373 196.000430191 ] -> Ff = 196.2
Arranjo 2 = [ 196.100432373 196.100432373 195.900529951 ] -> Ff = 196.3
Arranjo 3 = [ 196.100432373 196.100432373 195.799452688 ] -> Ff = 196.4
Arranjo 4 = [ 196.100432373 196.000430191 195.900529951 ] -> Ff = 196.2
Arranjo 5 = [ 196.100432373 196.000430191 195.799452688 ] -> Ff = 196.3
Arranjo 6 = [ 196.100432373 195.900529951 196.000430191 ] -> Ff = 196.0
Arranjo 7 = [ 196.100432373 195.900529951 195.799452688 ] -> Ff = 196.2
Arranjo 8 = [ 196.100432373 195.799452688 196.000430191 ] -> Ff = 195.9
Arranjo 9 = [ 196.100432373 195.799452688 195.900529951 ] -> Ff = 196.0
Arranjo 10 = [ 196.000430191 196.100432373 195.900529951 ] -> Ff = 196.2
Arranjo 11 = [ 196.000430191 196.100432373 195.799452688 ] -> Ff = 196.3
Arranjo 12 = [ 196.000430191 196.000430191 196.100432373 ] -> Ff = 195.9
Arranjo 13 = [ 196.000430191 196.000430191 195.900529951 ] -> Ff = 196.1
Arranjo 14 = [ 196.000430191 196.000430191 195.799452688 ] -> Ff = 196.2
Arranjo 15 = [ 196.000430191 195.900529951 196.100432373 ] -> Ff = 195.8
Arranjo 16 = [ 196.000430191 195.900529951 195.799452688 ] -> Ff = 196.1
Arranjo 17 = [ 196.000430191 195.799452688 196.100432373 ] -> Ff = 195.7
Arranjo 18 = [ 196.000430191 195.799452688 195.900529951 ] -> Ff = 195.9
Arranjo 19 = [ 195.900529951 196.100432373 196.000430191 ] -> Ff = 196.0
Arranjo 20 = [ 195.900529951 196.100432373 195.799452688 ] -> Ff = 196.2
Arranjo 21 = [ 195.900529951 196.000430191 196.100432373 ] -> Ff = 195.8
Arranjo 22 = [ 195.900529951 196.000430191 195.799452688 ] -> Ff = 196.1
Arranjo 23 = [ 195.900529951 195.900529951 196.100432373 ] -> Ff = 195.7
Arranjo 24 = [ 195.900529951 195.900529951 196.000430191 ] -> Ff = 195.8
Arranjo 25 = [ 195.900529951 195.900529951 195.799452688 ] -> Ff = 196.0
Arranjo 26 = [ 195.900529951 195.799452688 196.100432373 ] -> Ff = 195.6
Arranjo 27 = [ 195.900529951 195.799452688 196.000430191 ] -> Ff = 195.7
Arranjo 28 = [ 195.799452688 196.100432373 196.000430191 ] -> Ff = 195.9
Arranjo 29 = [ 195.799452688 196.100432373 195.900529951 ] -> Ff = 196.0
Arranjo 30 = [ 195.799452688 196.000430191 196.100432373 ] -> Ff = 195.7
Arranjo 31 = [ 195.799452688 196.000430191 195.900529951 ] -> Ff = 195.9
Arranjo 32 = [ 195.799452688 195.900529951 196.100432373 ] -> Ff = 195.6
Arranjo 33 = [ 195.799452688 195.900529951 196.000430191 ] -> Ff = 195.7
Arranjo 34 = [ 195.799452688 195.799452688 196.100432373 ] -> Ff = 195.5
Arranjo 35 = [ 195.799452688 195.799452688 196.000430191 ] -> Ff = 195.6
Arranjo 36 = [ 195.799452688 195.799452688 195.900529951 ] -> Ff = 195.7
```]

=== Sobreposições:

A partir dos arranjos obtidos, foram verificadas as sobreposições coms as frequências de entrada, que são as seguintes:

#sourcecode[```conf
Canais com Sobreposição:
Arranjo [196.100432373, 195.900529951, 196.000430191] -> Sobreposição com Ff = 196.0 (próximo de: 196.000430191 THz)
Arranjo [196.100432373, 195.799452688, 196.000430191] -> Sobreposição com Ff = 195.9 (próximo de: 195.900529951 THz)
Arranjo [196.100432373, 195.799452688, 195.900529951] -> Sobreposição com Ff = 196.0 (próximo de: 196.000430191 THz)
Arranjo [196.000430191, 196.000430191, 196.100432373] -> Sobreposição com Ff = 195.9 (próximo de: 195.900529951 THz)
Arranjo [196.000430191, 196.000430191, 195.900529951] -> Sobreposição com Ff = 196.1 (próximo de: 196.100432373 THz)
Arranjo [196.000430191, 195.900529951, 196.100432373] -> Sobreposição com Ff = 195.8 (próximo de: 195.799452688 THz)
Arranjo [196.000430191, 195.900529951, 195.799452688] -> Sobreposição com Ff = 196.1 (próximo de: 196.100432373 THz)
Arranjo [196.000430191, 195.799452688, 195.900529951] -> Sobreposição com Ff = 195.9 (próximo de: 195.900529951 THz)
Arranjo [195.900529951, 196.100432373, 196.000430191] -> Sobreposição com Ff = 196.0 (próximo de: 196.000430191 THz)
Arranjo [195.900529951, 196.000430191, 196.100432373] -> Sobreposição com Ff = 195.8 (próximo de: 195.799452688 THz)
Arranjo [195.900529951, 196.000430191, 195.799452688] -> Sobreposição com Ff = 196.1 (próximo de: 196.100432373 THz)
Arranjo [195.900529951, 195.900529951, 196.000430191] -> Sobreposição com Ff = 195.8 (próximo de: 195.799452688 THz)
Arranjo [195.900529951, 195.900529951, 195.799452688] -> Sobreposição com Ff = 196.0 (próximo de: 196.000430191 THz)
Arranjo [195.799452688, 196.100432373, 196.000430191] -> Sobreposição com Ff = 195.9 (próximo de: 195.900529951 THz)
Arranjo [195.799452688, 196.100432373, 195.900529951] -> Sobreposição com Ff = 196.0 (próximo de: 196.000430191 THz)
Arranjo [195.799452688, 196.000430191, 195.900529951] -> Sobreposição com Ff = 195.9 (próximo de: 195.900529951 THz)
```]

=== Resultado: 

Com os resultados obtidos, temos que:

#sourcecode[```conf
Número de conjuntos =  36
Número de sobreposições =  16
```]

= Conclusão: 

A partir dos conceitos vistos, alterações de código, e resultados obtidos, podemos concluir que a verificação de sobreposição de espectro é uma ferramenta importante para a análise de redes de transmissão, permitindo identificar quais canais estão próximos e podem causar interferência entre si. A partir dos resultados obtidos, é possível verificar que a tolerância utilizada influencia diretamente na quantidade de sobreposições encontradas, sendo necessário ajustar o valor de tolerância de acordo com a aplicação desejada.

Quanto maior a tolerância utilizada, maior a quantidade de sobreposições encontradas, sendo necessário um ajuste fino para encontrar o equilíbrio entre a quantidade de sobreposições e a precisão desejada, de acordo com o tamanho do canal sendo utilizado na transmissão.

