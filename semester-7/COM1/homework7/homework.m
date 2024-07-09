clc; close all; clear all;

M = 16;
info = randi([0 M-1],1,100);
info_mod = qammod(info, M);
SNR = 20;

info_r = awgn(info_mod, SNR, 'measured');
info_demod = qamdemod(info_r, M);
[num_erro(SNR+1), SER(SNR+1)] = symerr(info, info_demod);

scatterplot(info_r)
figure(2)
semilogy([0:15], SER)

% split the real and imaginary parts

info_r_real = real(info_r);

info_r_imag = imag(info_r);

% create a 4-PAM modulation for the real part: 

info_r_real_mod = pammod(info_r_real, 4);

% create a 4-PAM modulation for the imaginary part:

info_r_imag_mod = pammod(info_r_imag, 4);

% Plot the real part of the signal in the exis of time: 

figure(3)
subplot(2,1,1)
plot(info_r_real_mod)

