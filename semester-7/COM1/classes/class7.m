% Comparação de desempenho entre filtro passabaixa e filtro casado na transmissão em NRZ

clear all; close all; clc;

for Eb_No_db =  0:15
  Eb_No = 10^(Eb_No_db/10);
  Pb_uni(Eb_No_db+1) = qfunc(sqrt(Eb_No));
  Pb_bip(Eb_No_db+1) = qfunc(sqrt(2*Eb_No));
end

semilogy([0:15], Pb_uni, [0:15], Pb_bip, 'LineWidth', 2)
xlim([0 15])
ylim([1e-7 1])