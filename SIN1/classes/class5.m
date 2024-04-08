%% Author: Arthur Cadore 

close all;
clear all;
clc

%% Global variables; 
n = -20:20;

y=[2,1, zeros(1, length(n)-2)];

%% Operations: 


%item 1: 

x = n;
x(1:2)=0; 

for k = 1:(length(n)-2)

    y(k+2) = y(k+1)-0.24.*y(k)+x(k+2)-2.*x(k+1);

end

figure(1)
subplot(2,3,1);
stem(n,y); 



% item 2: 

a = [1,-1.143, 0.4128];
b = [0.0675, 0.1349, 0.0675];
c = zeros(1,50);
zi = filtic(b,a, [1,2]);
y = filter(b,a,c,zi);


subplot(2,3,2);
stem(y)


% item 3: 

a1 = [1, 2, -16];
b1 = [5, 2, -2];
c = zeros(1,50);
zi1 = filtic(b1,a1, [1,-1]);
y1 = filter(b1,a1,c,zi1);


subplot(2,3,3);
stem(y1)

% item 4: 

a2 = [1, -(9/16)];
b2 = [2, -1];
c = zeros(1,50);
zi2 = filtic(b2,a2, 16);
y2 = filter(b2,a2,c,zi2);


subplot(2,3,4);
stem(y2)

% item 5: 

a3 = [1, (9/16)];
b3 = [2, 1];
c = zeros(1,50);
zi3 = filtic(b3,a3, 16);
y3 = filter(b3,a3,c,zi3);


subplot(2,3,5);
stem(y3)



hold