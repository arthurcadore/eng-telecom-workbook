pkg load communications; % Carrega o pacote de comunicações

% Função para realizar a modulação QAM
function symbols = qam_modulate(data, M)
    % Define o número de bits por símbolo
    k = log2(M);
    % Define o tamanho da grade QAM
    n = sqrt(M);

    % Normaliza os dados
    data = mod(data, M);
    
    % Converte dados para uma matriz de símbolos
    symbols = zeros(size(data));
    for i = 1:numel(data)
        % Mapeia os dados para uma posição na matriz QAM
        x = mod(data(i), n) - (n-1)/2;
        y = floor(data(i) / n) - (n-1)/2;
        symbols(i) = x + 1i * y;
    end
end

% Função para realizar a demodulação QAM
function demodulated_data = qam_demodulate(symbols, M)
    % Define o número de bits por símbolo
    k = log2(M);
    % Define o tamanho da grade QAM
    n = sqrt(M);
    
    % Inicializa o vetor de dados demodulados
    demodulated_data = zeros(size(symbols));
    
    % Demodula cada símbolo
    for i = 1:numel(symbols)
        % Extrai a parte real e imaginária do símbolo
        x = real(symbols(i));
        y = imag(symbols(i));
        % Mapeia para a posição da matriz QAM
        x_idx = round(x + (n-1)/2);
        y_idx = round(y + (n-1)/2);
        % Converte para o índice de dados
        demodulated_data(i) = x_idx + n * y_idx;
    end
end

% Define a quantidade de dados a serem gerados
data_length = 1000;
data = randi([0 63], data_length, 1); % Gera dados aleatórios

% Loop para diferentes tamanhos de QAM
for M = [4, 16, 64]
    % Modulação QAM
    qam_symbols = qam_modulate(data, M);

    qam_ber = [];
    
    for snr = 1:14
        snr_linear = 10^(snr / 10);
        noise_variance = 1 / (2 * snr_linear);
        noise = sqrt(noise_variance) * (randn(size(qam_symbols)) + 1i * randn(size(qam_symbols)));

        qam_noisy = qam_symbols + noise;

        % Demodulação QAM
        qam_demodulated = qam_demodulate(qam_noisy, M);

        % Calcula o BER
        errors = sum(qam_demodulated ~= data);
        qam_ber = [qam_ber, errors / data_length];
    end

    % Plotando o gráfico para cada valor de M
    figure;
    semilogy(1:14, qam_ber, 'DisplayName', sprintf('%d-QAM', M));
    xlabel('SNR [dB]');
    ylabel('BER');
    title(sprintf('%d-QAM BER vs SNR', M));
    legend('show');
    grid on;
    set(gca, 'FontSize', 14);
end
