close all;
clear all;
clc;

t= -5:0.01:10;

%% Lista de exercicio:

e= u(t)- u(t-2); 
f= u(t+1)-2.*u(t)+u(t-1);
g=-u(t+3)+3.*u(t+1)-2.*u(t-1)+u(t-3);
h=r(t+1)-r(t)+r(t-2);
i= r(t+2)-r(t+1)-r(t-1)+r(t-2);
j= d(t)+d(t-1);
k= u(t)-u(t-1)+(-t+2).*[u(t-1)-u(t-2)];
l= (t-1).*[u(t-1)-u(t-2)]+u(t-2)-u(t-4);

%%Plot das funções:
figure(1);
subplot(2,4,1);
plot(t,e);
subplot(2,4,2);
plot(t,f);
subplot(2,4,3);
plot(t,g);
subplot(2,4,4);
plot(t,h);
subplot(2,4,5);
plot(t,i);
subplot(2,4,6);
plot(t,j);
subplot(2,4,7);
plot(t,k);
subplot(2,4,8);
plot(t,l);
hold


%% Lista de exercicio 3 parte 2: 

a = u(t)-u(t-1)-u(t-1)+2.*u(t-3);

b = u(t)-u(t-2);

c = u(t)-2.*u(t-1)+u(t-2);

d = -t.*[u(t+4)-u(t)]+t.*[u(t)-u(t-2)];

figure(2);
hold
subplot(2,2,1);
plot(t,a);
subplot(2,2,2);
plot(t,b);
subplot(2,2,3);
plot(t,c);
subplot(2,2,4);
plot(t,d);
