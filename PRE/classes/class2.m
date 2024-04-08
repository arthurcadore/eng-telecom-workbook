#Aulo: Arthur Cadore M. Barcella

% clears e importações: 
clear all; close all; clc;
pkg load statistics;

% Número de realizações
N = 100000000; 

%Variáveis da função:
beta = 100;
x0 = 10;
dx = 5;

% desloca a função para a direta para evitar o erro em "0";
desloc = (dx/2);

% Aumenta o range de amostragem para evitar erro no final da função.
finalRemover = 10;

%Operações: 
x = (-beta: dx: finalRemover*beta) + desloc;
X = exprnd(beta, 1, N);

pdfX_teo = (1/beta)*exp(-x/beta).*(x>0);
pdfX_sim = hist(X,x) / (N*dx); 

%Plotagem: 
figure; hold on; grid on; 


bar(x,pdfX_sim,'y');
plot(x,pdfX_teo,'b','LineWidth', 3);

Pr_abaixo_x0_teo = 1 - exp(-x0/beta);
Pr_abaixo_x0_sim = mean(X<x0); 
