%% Author: Arthur Cadore 

close all;
clear all;
clc

%% Global variables; 
n = -1:6;
y=16; % initial condition


%% Operations: 

x = n.^2;
x(1)=0; 

for k = 1:(length(n)-1)

    y(k+1)= 0.5.*y(k)+(k+1);

end

figure(1)
subplot(1,1,1);
stem(n,y); 
hold