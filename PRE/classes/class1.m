% Aluno: Arthur Cadore M. Barcella
% github: arthurcadore
% Data: 11/09/2023
%============================================================================
clear all; close all; clc;

N = 1000000;             % Numero de realizações;
U = randi([1 6], 1, N);  % Define a faixa de lançamento do dado:

%============================================================================
% Indexação de cada face do dado:

idx1 = (U == 1 | U == 2);         % Se for igual a 1 ou 2, assume o valor 'idx1'
idx2 = (U == 3);                  % Se for igual a 3, assume o index 'idx2'
idx3 = (U == 4 |U == 5 | U == 6); % Se for igual a 4, 5 ou 6, assume o valor 'idx3'

%============================================================================
% Setando os valores a partir da indexação: 

X = zeros(1, N);    % Gera um vetor com as posições zeradas 
                    % para evitar alocação dinâmica de memória.  %

X(idx1) = (3*rand(1,sum(idx1))+1);         % Se U = 1 ou 2     ->   X = Unif([1,4]);
X(idx2) = 2;                               % Se U = 3          ->   X = 1/2;
X(idx3) = randi([1 4], 1, sum(idx3));      % Se U = 4, 5 ou 6  ->   X = Unif([1,2,3,4]);

%============================================================================                                  
% Item a: 

dx = 0.02;         % Definição do operador de passo utilizado
x = 0 : dx : 5;   % Definição dos limites de simulação

% Calculo de PDF de X (Simulada e Teórica):
pdfX_sim = hist(X, x) / (N * dx);
pdfX_teo = [(2/6) * (1/3) * [(x >= 1 & x <= 4)]];

% Impressao da PDF de simulada de X: 
figure; hold on; grid on; 
bar(x, pdfX_sim);

%Desenho dos impulsos: 
plot([2, 2], [1/8, 7/24], 'b', 'LineWidth', 3');
plot([2], [7/24], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([1, 1], [0, 1/8], 'b', 'LineWidth', 3');
plot([1], [1/8], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([2, 2], [0, 1/8], 'b', 'LineWidth', 3');
plot([2], [1/8], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([3, 3], [0, 1/8], 'b', 'LineWidth', 3');
plot([3], [1/8], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([4, 4], [0, 1/8], 'b', 'LineWidth', 3');
plot([4], [1/8], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');


% Impressao da PDF teórica de X: 
plot(x, pdfX_teo, 'b', 'LineWidth',3);

% Definição dos limites dos eixos: 
xlim([-1 5]); ylim([-0.1 1]);

% Definição dos nomes de cada eixo:
xlabel('x'); ylabel('Fx(x)');


%============================================================================
% Item b: 
cdfX_sim = cumsum(pdfX_sim) * dx;
cdfX_teo = 0                                                                       .* (x < 1) + ... 
           (1/8 + (2/18 * x - 2/18))                                               .* (1 < x & x <= 2) + ...
           (1/8 + (4/18 -1/18) + 1/8 + (2/18 * x - 2/18))                          .* (2 < x & x <= 3) + ...  
           (1/8 + (4/18 - 1/18) + 1/8 + (3/18 - 2/18) + 1/8 + (2/18 * x - 3/18))   .* (3 < x & x < 4) + ...   
            1                                                                      .* (4 <= x);
            

% Impressao da CDF teórica e simulada de X: 
figure; hold on;  grid on;
plot(x, cdfX_sim, 'y', 'LineWidth',9);
plot(x, cdfX_teo, 'b', 'LineWidth',2);
xlim([-1 5]); ylim([-0.1 1.2]);
xlabel('x'); ylabel('Fx(x)');

%============================================================================
% Item c: 

% Calculo da Média total (simulada e teórica) de X: 
EX_sim = mean(X)
EX_teo = 29/12

%============================================================================
% Item d:

% Calculo da probabilidade de X dado que X > 3:
 
PrX_lt3_sim = mean(X < 3)     % Probabilidade de X < 1 simulada
%PrX_lt1_teo = 2/3             % Probabilidade de X < 1 calculada 
