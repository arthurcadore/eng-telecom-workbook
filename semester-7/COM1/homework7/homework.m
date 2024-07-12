clc; close all; clear all;

M = 16;
Vector_lenght = 100;
info = randi([0 M-1],1,Vector_lenght);
info_mod = qammod(info, M);
SNR = 20;

% info_r = awgn(info_mod, SNR, 'measured');
info_r = info_mod;
info_demod = qamdemod(info_r, M);
[num_erro(SNR+1), SER(SNR+1)] = symerr(info, info_demod);

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

t = [0:ts:Vector_lenghtVector_lenghtts-ts];

% upsample and filter the real part
filtro_NRZ = ones(1,Vector_lenght);
info_r_real_up = upsample(info_r_real, Vector_lenght);
info_r_real_tx = filter(filtro_NRZ, 1, info_r_real_up);

figure(1);
plot(t,info_r_real_tx);

% upsample and filter the imag part
info_r_imag_up = upsample(info_r_imag, Vector_lenght);
info_r_imag_tx = filter(filtro_NRZ, 1, info_r_imag_up);

figure(2);
plot(t,info_r_imag_tx);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% multiplicate the real and imag part by a signal; 

info_real_tx = info_r_real_tx.*cos(2*pi*1000*t);
info_imag_tx = info_r_image_tx.*-sin(2*pi*1000*t);
