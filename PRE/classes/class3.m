clear all; close all; clc;

N = 1000000; % numero de realizações;

U = 4*rand(1, N);

idx1 = (U <= 1);
idx2 = (U > 1);

X = zeros(1, N);

X(idx1) = 2 * rand(1, sum(idx1));

X(idx2) = (rand(1, sum(idx2)) < 2/3);

dx = 0.01; 
x = -1 : dx : 3;

pdfX_sim = hist(X, x) / (N * dx);
pdfX_teo = (1/8) * (0 <= x & x <= 2);
cdfX_sim = cumsum(pdfX_sim) * dx;
cdfX_teo = 0               .* (x < 0) + ... 
           (1/4 + x/8)     .* (0 <= x & x < 1) + ...
           (7/8 + (x-1)/8) .* (1 <= x & x < 2) + ...
           1               .* (2 <= x);


figure;
hold on; 
grid on;
bar(x, pdfX_sim);
%plot([0], [1/4], 'b^', 'LineWidth', 12, 'MarkFaceColor', 'b');
plot([0 0], [0 1/4], 'b','LineWidth',3);
plot([1 1], [0 1/2], 'b','LineWidth',3);
plot(x, pdfX_teo, 'b', 'LineWidth',3);
xlim([-1 3]); ylim([-0.1 0.6]);
xlabel('x'); ylabel('Fx(x)');

figure;
hold on; 
grid on;

plot(x, cdfX_sim, 'y', 'LineWidth',7);
plot(x, cdfX_teo, 'b', 'LineWidth',2);
xlabel('x'); ylabel('Fx(x)');

EX_sim = mean(X)
EX_teo = 3/4
