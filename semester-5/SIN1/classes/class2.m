%% Aula 13-04

% Aluno: Arthur Cadore M. B. 

%% Formatação base: 

close all
clear all
clc

%% Variavel de faixa: 

n= -10:10;

%% Lista SIGAA: 

%a = u(t+2) - u(t-4);

a = (n+2).*((u(n+4)-u(n-3)));

b = -u(n+4)+2*u(n)-2.*u(n-4)+u(n-8);

c = 2.*u(n)-u(n-3)-u(n-5);

d = (n-2).*(u(n-2)-u(n-6));

e = u(n)+2.*u(n-5)-u(n-10); 

%% Item 3.3.3 (livro)

f = u(n-2)-u(n-6);

g = n.*(u(n)-u(n-7));

h = (n-2).*(u(n-2)-u(n-6));

i = (-n+8).*(u(n-6)-u(n-9));

j = (n-2).*(u(n-2)-u(n-6))+(n-2).*(u(n-2)-u(n-6));

%% Plot das funções (lista SIGAA):

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
hold

%% Plot das funções (lista libro, item 3.3.3):

figure(2)
subplot(2,3,1);
stem(n,f);
subplot(2,3,2);
stem(n,g);
subplot(2,3,3);
stem(n,h);
subplot(2,3,4);
stem(n,i);
subplot(2,3,5);
stem(n,j);
hold

