clear all
close all
clc

t= -10:0.01:10;

%% Lista de exercicio AA1-4:

% item 1: 

a = cos(t)+sin(t)+sin(t).*cos(t);

b = 1+(t)+3.*[(t).^2]+5.*[(t).^3]+9.*[(t).^4];

c = 1+[t.*cos(t)]+(t.^2).*sin(t)+(t.^3).*sin(t).*cos(t);

figure(1)
subplot(2,2,1);
plot(t,a);
subplot(2,2,2);
plot(t,b);
subplot(2,2,3);
plot(t,c);
hold

