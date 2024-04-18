clear all; close all; clc;

pkg load statistics

N = 10000; % numero de realizações;

X = zeros(1, N);
Y = zeros(1, N);

for i = 1 : N
  urna = ['R', 'R', 'G', 'B'];
  idx1 = randi([1 4]);
  B1 = urna(idx1);
  urna(idx1) = [];
  idx2 = randi([1 3]);
  B2 = urna(idx2);
  urna(idx2) = [];
  X(i) = sum ([B1 B2] == 'R');
  Y(i) = sum ([B1 B2] == 'G');
end

x = [0 1 2];
y = [0 1];

pmfXY_sim = (hist3([X' Y'], {x, y})/N)

pmfXY_teo = [  0  1/6;
             1/3  1/3;
             1/6  0]
