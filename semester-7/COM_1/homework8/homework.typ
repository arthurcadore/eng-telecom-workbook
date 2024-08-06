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

Para calcular o desempenho de modulações MPSK, foi implementado um script em MATLAB que realiza a modulação e demodulação dos sinais, calculando a taxa de erro de bit (BER) para diferentes valores de M. 

O script gera dados aleatórios binários, modula os dados e adiciona ruído gaussiano branco, demodula os sinais e calcula a taxa de erro de bit para diferentes valores de SNR.

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

A seguir, são apresentados os gráficos de BER para diferentes valores de M.


=== 4-MPSK

O primeiro gráfico apresenta a taxa de erro de bit (BER) para a modulação 4-PSK. Note que a BER diminui à medida que o SNR aumenta, o que é esperado, isso pois o sinal se torna mais robusto em relação ao ruído, ou seja, fica mais distinguivel ao receptor. 

#figure(
  figure(
    rect(image("./pictures/4psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 4-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 8-MPSK

Já no gráfico da modulação 8-PSK, é possível observar que a BER é maior em relação à modulação 4-PSK, isso ocorre pois a modulação 8-PSK possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/8psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 8-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 16-MPSK

Da mesma maneira, o gráfico da modulação 16-PSK apresenta uma BER ainda maior, isso ocorre pois a modulação 16-PSK possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/16psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 16-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== 32-MPSK

Novamente, o gráfico da modulação 32-PSK apresenta uma BER ainda maior, isso ocorre pois a modulação 32-PSK possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/32psk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 32-PSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Desempenho comparativo: 

Abaixo podemos observar um gráfico comparativo entre as modulações MPSK, onde é possível observar que a BER aumenta à medida que o número de fases aumenta, isso ocorre pois o sinal se torna mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

Note que a modulação 4-PSK possui a menor BER, enquanto a modulação 32-PSK possui a maior BER, isso ocorre pois um sinal modulado com mais fases é mais suscetível a erros devido ao ruído.

#figure(
  figure(
    rect(image("./pictures/mpsk.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) comparativa]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo está o script correspondente para gerar a imagem apresentada acima:

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

Para calcular o desempenho de modulações MQAM, foi implementado um script em MATLAB que realiza a modulação e demodulação dos sinais, calculando a taxa de erro de bit (BER) para diferentes valores de M. 

O script gera dados aleatórios, modula os dados e adiciona ruído gaussiano branco, demodula os sinais e calcula a taxa de erro de bit para diferentes valores de SNR.

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

A seguir, são apresentados os gráficos de BER para diferentes valores de M.

=== 4-MQAM

O primeiro gráfico apresenta a taxa de erro de bit (BER) para a modulação 4-QAM. Note que a BER diminui à medida que o SNR aumenta, o que é esperado, isso pois o sinal se torna mais robusto em relação ao ruído, ou seja, fica mais distinguivel ao receptor. 

Porem, note que esse caimento é bastante acentuado, isso ocorre pois a modulação 4-QAM possui menos fases, o que torna o sinal mais robusto em relação ao ruído, dessa forma, a curva se aproxima mais da esquerda da imagem, pois o sinal precisa de um SNR menor para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/4qam.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 4-QAM]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== 16-MQAM

Já no gráfico da modulação 16-QAM, é possível observar que a BER é maior em relação à modulação 4-QAM, isso ocorre pois a modulação 16-QAM possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/16qam.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 16-QAM]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== 64-MQAM

Por fim, o gráfico da modulação 64-QAM apresenta uma BER ainda maior, isso ocorre pois a modulação 64-QAM possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

#figure(
  figure(
    rect(image("./pictures/64qam.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) para modulação 64-QAM]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Desempenho comparativo:

Abaixo podemos ver um comparativo entre as modulações MQAM, onde é possível observar que a BER aumenta à medida que o número de fases aumenta, isso ocorre pois o sinal se torna mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

Note que a modulação 4-QAM possui a menor BER, enquanto a modulação 64-QAM possui a maior BER, isso ocorre pois um sinal modulado com mais fases é mais suscetível a erros devido ao ruído.

#figure(
  figure(
    rect(image("./pictures/mqam.png")),
    numbering: none,
    caption: [Taxa de erro de bit (BER) comparativa]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo está o script correspondente para gerar a imagem apresentada acima:

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

= Conclusão:

Apartir dos conceitos apresentados, testes realizados e resultados obtidos, podemos concluir que a modulação MPSK é mais robusta em relação ao ruído em comparação com a modulação MQAM, isso ocorre pois a modulação MPSK possui menos fases, o que torna o sinal mais robusto em relação ao ruído, dessa forma, a curva se aproxima mais da esquerda da imagem, pois o sinal precisa de um SNR menor para ser distinguido do ruído.

Por outro lado, a modulação MQAM possui mais fases, o que torna o sinal mais suscetível a erros devido ao ruído, dessa forma, a curva se aproxima mais da direita da imagem, pois o sinal precisa de um SNR maior para ser distinguido do ruído.

Dessa forma, a escolha entre MPSK e MQAM depende do ambiente de comunicação, se o ambiente possui muito ruído, a modulação MPSK é mais indicada, por outro lado, se o ambiente possui menos ruído, a modulação MQAM é mais indicada.

= Referências Bibliográficas:

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]


