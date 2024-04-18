clear all; close all; clc;

N = 100000; % numero de realizações;

p = 0.2; % probabilidade de sucesso da bernoulli;

% como gerar uma bernoulli
x = rand() < p; 

% como gerar a geométrica
aux = 1
while (rand() < p) == 0
 aux = aux + 1;
end

% imprimindo a geométrica
aux

a = zeros(1,N);

for i = 1:N
% como gerar a geométrica
 a(i) = 1;
    while (rand() < p) == 0
    a(i) = a(i) + 1;
 end
end

b = 1 : max(a)

pmfX = p .* (1 - p).^(b - 1);

pfmX_sim = hist(a, b) / N; 

figure; grid on; hold on; 

bar(b, pfmX_sim, 'y');
stem (b, pmfX, 'b');
xlim([0, max(b)]);

Ex_teo = 1 /p 

Ex_sim = mean(a)



