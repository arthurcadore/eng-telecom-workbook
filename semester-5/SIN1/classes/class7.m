close all
clear all
clc

t= -5:0.01:10;

%% Lista em aula: 

a = u(t+2) - u(t-4);

b = u(t) - u(t-1) + u(t-4) - u(t-5);

c = t.*[u(t) - u(t-1)];

n = 2.*t.*[u(t)-u(t-1)];

%% Lista de exercicio:

e= u(t)- u(t-2); 
f= u(t+1)-2.*u(t)+u(t-1);
g=-u(t+3)+3.*u(t+1)-2.*u(t-1)+u(t-3);
h=r(t+1)-r(t)+r(t-2);
i= r(t+2)-r(t+1)-r(t-1)+r(t-2);
j= d(t) + d(t-1);
k= u(t)-u(t-1)+(-t+2).*[u(t-1)-u(t-2)];
l= (t-1).*[u(t-1)-u(t-2)]+u(t-2)-u(t-4);

%%Plot das funções:

subplot(2,3,1);
plot(t,e);
subplot(2,3,2);
plot(t,f);
subplot(2,3,3);
plot(t,g);
subplot(2,3,4);
plot(t,h);
subplot(2,3,5);
plot(t,i);
subplot(2,3,6);
plot(t,j);
