#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set highlight(
  fill: rgb("#c1c7c3"),
  stroke: rgb("#6b6a6a"),
  extent: 2pt,
  radius: 0.2em, 
  ) 

#show: doc => report(
  title: "Análise de Desempenho de Modulações Digitais",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "29 de Julho de 2024",
  doc,
)

= Introdução: 

O objetivo deste relatório é analisar o desempenho das modulações digitais MPSK e MQAM em um sistema de comunicação digital. Para isso, foram simuladas diferentes modulações e analisados os resultados obtidos.

= Desenvolvimento e Resultados: 

O desenvolvimento deste relatório foi dividido em três diferentes seções, onde foi analisado o desempenho individual de cada modulação e em seguida um comparativo entre as duas diferentes modulações. 

== Desempenho de modulações MPSK

#sourcecode[```matlab
clear all; close all; clc
pkg load communications;

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

% Define a quantidade de dados a serem gerados
data_length = 1000;
data = randi([0 1], data_length, 1); % Gera dados aleatórios binários

for M = [4, 8, 16, 32]
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

    % Plotando o gráfico para cada valor de M
    figure;
    semilogy(1:34, psk_ber, 'DisplayName', sprintf('%d-PSK', M));
    xlabel('SNR [dB]');
    ylabel('BER');
    title(sprintf('%d-PSK BER vs SNR', M));
    legend('show');
    grid on;
    set(gca, 'FontSize', 14);
end

```]	

=== 4-MPSK

#figure(
  figure(
    rect(image("./pictures/4psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 4-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 8-MPSK

#figure(
  figure(
    rect(image("./pictures/8psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 8-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 16-MPSK

#figure(
  figure(
    rect(image("./pictures/16psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 16-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 32-MPSK

#figure(
  figure(
    rect(image("./pictures/32psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 32-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Desempenho comparativo: 

#figure(
  figure(
    rect(image("./pictures/mpsk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) comparativa]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#sourcecode[```matlab

Clear all; close all; clc;
pkg load communications;

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
    data_length = 1000;
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

```]

== Desempenho de modulações MQAM

#sourcecode[```matlab
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
```]

=== 4-MQAM

=== 16-MQAM

=== 64-MQAM

=== Desempenho comparativo:

#figure(
  figure(
    rect(image("./pictures/mqam.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) comparativa]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#sourcecode[```matlab
clear all; close all; clc;
pkg load communications; 

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

figure;
hold on;
grid on;
set(gca, 'FontSize', 14);

for M = [4, 16, 64]
    % Define a quantidade de dados a serem gerados
    data_length = 1000; % Número reduzido de amostras
    data = randi([0 M-1], data_length, 1); % Gera dados aleatórios

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

    semilogy(1:14, qam_ber, 'DisplayName', sprintf('%d-QAM', M));
end

xlabel('SNR [dB]');
ylabel('BER');
legend('show');
hold off;
```]

== Comparação de modulações PSK vs. QAM

=== 4-PSK vs. 4-QAM

=== 16-PSK vs. 16-QAM

=== 64-PSK vs. 64-QAM

= Conclusão:

= Referências Bibliográficas:

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]


