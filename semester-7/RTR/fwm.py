# IFSC Câmpus São José
# Engenharia de Telecomunicações
# RTR029007 Redes de Transmissão
# Professor: Fábio Alexandre de Souza
# Four Wave Mixing

import os
#os.system('clear')

import itertools
print('===========================Inicio======================')


print('Ff = fi + fj - fk, onde i dif k e j dif k')

#Entradas

n = int(input('Digite n: '))

canais = list()

for cont in range(0,n):
   canais.append(float(input('Digite f em THz: ')))

#Arranjos
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








