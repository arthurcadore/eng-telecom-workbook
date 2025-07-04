#!/bin/bash

# Caminho absoluto do seu projeto
PROJ_DIR="/home/cadore/Downloads/omnet2/omnetpp-6.1/samples/projeto1-ADS"
INI="$PROJ_DIR/simulations/omnetpp.ini"
BACKUP="$INI.bak"

# Parâmetros possíveis
gen0s=(0.7 0.8)
gen1s=(0.9 1.3)
gen2s=(0.7 1.5)

# Backup do .ini original
cp "$INI" "$BACKUP"

cd "$PROJ_DIR"
. /home/cadore/Downloads/omnet2/omnetpp-6.1/setenv

for gen0 in "${gen0s[@]}"; do
  for gen1 in "${gen1s[@]}"; do
    for gen2 in "${gen2s[@]}"; do
      # Edita o .ini para os valores atuais
      sed -i "/\\*\\.gen0\\.interArrivalTime/c\\*.gen0.interArrivalTime = ${gen0}s" "$INI"
      sed -i "/\\*\\.gen1\\.interArrivalTime/c\\*.gen1.interArrivalTime = ${gen1}s" "$INI"
      sed -i "/\\*\\.gen2\\.interArrivalTime/c\\*.gen2.interArrivalTime = ${gen2}s" "$INI"

      # Rodar a simulação
      ./out/gcc-release/src/projeto1-ADS -u Cmdenv -c General simulations/omnetpp.ini

      # Renomear os arquivos de saída para não sobrescrever
      mv simulations/results/General-#0.sca simulations/results/General-g0=${gen0}-g1=${gen1}-g2=${gen2}.sca
      mv simulations/results/General-#0.vec simulations/results/General-g0=${gen0}-g1=${gen1}-g2=${gen2}.vec
    done
  done
done

# Restaurar o .ini original
mv "$BACKUP" "$INI"