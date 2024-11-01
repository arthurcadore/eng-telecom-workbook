clear all
close all
clc 

Rs = 10e3;
Ts = 1/Rs;
fd = 40; 
M = 2;

canal = rayleighchan(Ts, fd);

info = randint(1, 1000, M);
sinal_tx = pskmod(info, M);
canal.StoreHistory = 1;
sinal_rx_ray = filter(canal, sinal_tx);

plot(canal);
h = canal.PathGains;
plot(20*log10(abs(h)));

## Plot of the channel impulse response (Gaussian)
hist(real(h), 100);
hist(imag(h), 100);

## rayleighchan distribution
hist(abs(h), 100);

h = transpose(cana.PathGains);

for SNR = 0:20
    SNR 
    sinal_rx_ruido_ray = awgn(sinal_rx_ray, SNR);
    sinal_rx_eq_ray = sinal_rx_ruido_ray ./ h;
    sinal_demod_ray = pskdemod(sinal_rx_eq, M);
    [num_err(SNR + 1), taxa_err(SNR + 1)] = symerr(info, sinal_demod_ray);

    sinal_rx_awgn = awgn(sinal_tx, SNR);
    sinal_demod_awgn = pskdemod(sinal_rx_awgn, M);
    [num_err_awgn(SNR + 1), taxa_err_awgn(SNR + 1)] = symerr(info, sinal_demod_awgn);
end

title('BER vs SNR');
semilogy([0:20], taxa_err, [0:20], taxa_err_awgn);

