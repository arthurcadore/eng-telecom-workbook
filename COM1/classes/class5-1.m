clear all; 
close all; 
clc;

fs = 100e3;
ts = 1/fs; 
f1 = 1e3; 
f2 = 3e3; 
t = [0:ts:1];

a1 = 10;
a2 = 5;

x1_t = a1*sin(2*pi*f1*t);
x2_t = a2*sin(2*pi*f2*t);
s_t = x1_t + x2_t; 

passo_f = 1;
f = [-fs/2:passo_f:fs/2];
filtro_PB_f = [zeros(1, 48000) ones(1, 4001) zeros(1, 48000)];
S_f = fftshift(fft(s_t));

figure(1)
subplot(211);
plot(t, s_t);
xlim([0 5*(1/f1)]);
grid on; 

subplot(212);
plot(f,abs(S_f);

figure(2)
subplot(311)
plot(f,abs(S_f);
ylim([0 1.2])
xlim([-10000 10000])

subplot(312)
plot(f, filtro_PB_f);
ylim([0 1.2])
xlim([-10000 10000])

Y_f = abs(S_f) .* filtro_PB_f;

subplot(313)
plot(f, Y_f);
ylim([0 1.2*a1])
xlim([-10000 10000])]

y_t = ifft(ifftshift(Y_f));

figure(3)
subplot(211)
plot(f, Y_f);
ylim([0 1.2*a1])
xlim([-10000 10000])]

subplot(212)
plot(t, y_t);
xlim([0 0.002])
