%% Aula 11/05

% Aluno: Arthur Cadore M. B. 

%% Formatação base: 

close all
clear all
clc

n= 0:30;

%% sen (30 unidades) com periodicidade de 16 unidades

a=sin(n/2.5);

b=zeros(length(n),1);
b(1)=1;

c=conv(a,b);
      
%% Plot: 

figure(1)
subplot(3,1,1);
stem(n,a);


subplot(3,1,2);
stem(n,b);
axis([-10 10 -1 1])
hold


subplot(3,1,3);
stem(c);
axis([0 35 -1 1])
hold

