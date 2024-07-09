clc; close all; clear all;

M = 16;
Vector_lenght = 1000;
info = randi([0 M-1],1,Vector_lenght);
info_mod = qammod(info, M);
SNR = 20;

% info_r = awgn(info_mod, SNR, 'measured');
info_r = info_mod;x
info_demod = qamdemod(info_r, M);
[num_erro(SNR+1), SER(SNR+1)] = symerr(info, info_demod);

scatterplot(info_r)
figure(2)
semilogy([0:15], SER)

% split the real and imaginary parts

info_r_real = real(info_r);

info_r_imag = imag(info_r);

% ========================================

% Defining the ratebit: 

rb = 1; 
rs = rb/log2(M);
ts = 1/rs;

% ========================================

% Defining the time vector:

t = [0:ts:Vector_lenght*ts-ts];

% upsample and filter the real part

info_r_real_up = upsample(info_r_real, rs);

filtro = ones(1, rs);

info_r_real_tx = filter(filtro, 1, info_r_real_up);


