%% Aula 25/05

% Aluno: Arthur Cadore M. B. 

%% Formatação base: 

close all
clear all
clc

t=-10:0.001:10;
w0=1;
a=1;

%% 

h=a*square(t);

h1 = ((-2/pi)*cos(pi)+(2/pi))*sin(t);

h3 = ((-2/3*pi)*cos(3*pi)+(2/3*pi))*sin(3.*t);

h5 = ((-2/5*pi)*cos(5*pi)+(2/5*pi))*sin(5.*t);

h7 = ((-2/7*pi)*cos(7*pi)+(2/7*pi))*sin(7.*t);

h9 = ((-2/9*pi)*cos(9*pi)+(2/9*pi))*sin(9.*t);


hr1= h1;

hr2= h1+h3;

hr3= h1+h3+h5;

hr4= h1+h3+h5+h7;

hr5= h1+h3+h5+h7+h9;


s = 100;

htot=0;
htot1=0;
htot2=0;
htot3=0;
for c = 1:s
    
    hf0 = ((-2/c*pi)*cos(c*pi)+(2/c*pi))*sin(c.*t);
   
    hf1 = ((-2/c*pi)*cos(pi)+(2/c*pi))*sin(c.*t);
    
    hf2 = ((-2/pi)*cos(pi)+(2/pi))*sin(c.*t);
    
    hf3 = ((-2/c*pi)*cos(c*pi)+(2/pi))*sin(c.*t);
    
    
    %figure(c)
    %plot(t,hf);
    htot=hf0+htot;
    htot1=hf1+htot1;
    htot2=hf2+htot2;
    htot3=hf3+htot3;
        
end
      
%% Plot: 

figure(1)
subplot(3,2,1);
plot(t,htot);
hold;

subplot(3,2,2);
plot(t,hr1);
axis([-10 10 -1.5 1.5])
hold

subplot(3,2,3);
plot(t,hr2);
hold

subplot(3,2,4);
plot(t,hr3);
hold

subplot(3,2,5);
plot(t,hr4);
hold

subplot(3,2,6);
plot(t,hr5);
hold

%%

%figure(2)
%plot(t,h1);
%hold on
%plot(t,h3);
%hold on
%plot(t,h5);

% teste

figure(3)
subplot(2,2,1);
plot(t,htot);
hold;

subplot(2,2,2);
plot(t,htot1);
hold;

subplot(2,2,3);
plot(t,htot1);
hold;

subplot(2,2,4);
plot(t,htot1);
hold;
