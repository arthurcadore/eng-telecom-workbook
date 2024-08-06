pkg load communications; % Carrega o pacote de comunicações

% Função para realizar a modulação PSK
function symbols = psk_modulate(data, M)
    phase_step = 2 * pi / M;
    phases = (0:M-1) * phase_step;
    symbols = exp(1i * phases(data + 1));
end

% Função para realizar a demodulação PSK
function demodulated_data = psk_demodulate(symbols, M)
    phase_step = 2 * pi / M;
    phases = (0:M-1) * phase_step;
    [~, demodulated_data] = min(abs(symbols(:) - exp(1i * phases)), [], 2);
    demodulated_data = demodulated_data - 1;
end

figure;
hold on;
grid on;
set(gca, 'FontSize', 14);

for M = [4, 8, 16, 32]
    % Define a quantidade de dados a serem gerados
    data_length = 5000;
    data = randi([0 M-1], data_length, 1); % Gera dados aleatórios

    % Modulação PSK
    psk_symbols = psk_modulate(data, M);

    psk_ber = [];

    for snr = 1:34
        snr_linear = 10^(snr / 10);
        noise_variance = 1 / (2 * snr_linear);
        noise = sqrt(noise_variance) * (randn(size(psk_symbols)) + 1i * randn(size(psk_symbols)));

        psk_noisy = psk_symbols + noise;

        % Demodulação PSK
        psk_demodulated = psk_demodulate(psk_noisy, M);

        % Calcula o BER
        errors = sum(psk_demodulated ~= data);
        psk_ber = [psk_ber, errors / data_length];
    end

    semilogy(1:34, psk_ber, 'DisplayName', sprintf('%d-PSK', M));
end

xlabel('SNR [dB]');
ylabel('BER');
legend('show');
hold off;
