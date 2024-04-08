clear all; close all; clc; 

N = 100000000 % Número de realizações 

X = rand(1, N); 

% forma para deslocar o intervalo randomico (de 11 a 15 nesse exemplo); 
X1 = (rand(1,N) * 4) + 11; 

Y = X.^2;


dx = 0.01; x = -0.2 : dx : 1.2; 
dy = 0.01; y = -0.2 : dy : 1.2;

pdfX_teo = 1 * (0 <= x & x <= 1);
pdfX_sim = hist(X, x) / (N * dx);

pdfY_teo = (0.5 ./ sqrt(y)) .* (0 <= y & y <= 1);
pdfY_sim = hist(Y, y) / (N * dy);

EX_teo = 1/2
EX_sim = mean(X)

EY_teo = 1/3
EY_sim = mean(Y)

figure; 

subplot(1, 2, 1); grid on; hold on;

bar(x, pdfX_sim);
plot(x, pdfX_teo);
xlabel ("teste");
ylabel ("sin (x)");

subplot(1, 2, 2); grid on; hold on;

bar(x, pdfY_sim);
plot(x, pdfY_teo);
xlabel ("teste");
ylabel ("sin (x)");
