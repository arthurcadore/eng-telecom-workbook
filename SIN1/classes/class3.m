%% Aula 13-04

% Aluno: Arthur Cadore M. B. 

%% Formatação base: 

close all
clear all
clc

%% Variavel de faixa: 

n= -20:20;

n1= -100:100;

%% Lista (item 3.6, pag:234): 

a = (1).^n; 

b = (-1).^n;

c = (0.5).^n;

d = (-0.5).^n;

e = (0.5).^-n;

f = (2).^-n;

%% Plot das funções (item 3.6, pag:234):

figure(1)
subplot(2,3,1);
stem(n,a);
subplot(2,3,2);
stem(n,b);
subplot(2,3,3);
stem(n,c);
subplot(2,3,4);
stem(n,d);
subplot(2,3,5);
stem(n,e);
subplot(2,3,6);
stem(n,f);
hold

%% Lista (item 3.3.5, pag:236): 

a = cos((pi/12).*n1+(pi/4));

%% Plot das funções (item 3.1, pag:235):

figure(2)
subplot(1,1,1);
stem(n1,a);
hold

