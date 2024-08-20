clc; close all; clear all;

tmin = 0;
tmax = 2;
Omega_s = 8000;
Fs = Omega_s;
Ts = 1/Fs;
L = (tmax - tmin)/Ts;
t = 0:Ts:tmax-Ts;

f1 = 770;
f2 = 852;
f3 = 941;

s_t = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
S_f = fft(s_t);
S_f = abs(2*S_f/L);
S_f = fftshift(S_f);
freq = Fs*(-(L/2):(L/2)-1)/L;

figure;
subplot(2,1,1);
plot(t,s_t);
ylabel('Amplitude');
xlabel('Tempo (s)');
title('Sinal de entrada');

subplot(2,1,2);
plot(freq,S_f);
title('Espectro do sinal composto de três componentes senoidais');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);

% Filtro de 770Hz Butterworth
Num = Numerator = [
     0.000000000007648974625344080593812088956; 0; 
    -0.000000000030595898501376322375248355826; 0; 
     0.000000000045893847752064483562872533739; 0; 
    -0.000000000030595898501376322375248355826; 0;
     0.000000000007648974625344080593812088956 
];

Den = [1;
    -6.573968478516325930627317575272172689438; 
    20.197703598146055981032986892387270927429; 
   -37.435767531546105146844638511538505554199; 
    45.612066895335409810741111868992447853088; 
   -37.354424964373507123127637896686792373657; 
    20.110025517173959030969854211434721946716; 
    -6.5312086462963758748401232878677546978; 
     0.991336860368820738109718604391673579812 
];

s_770hz = filter(Num, Den, s_t);
S_770hz = fft(s_770hz);
S_770hz = abs(2*S_770hz/L);
S_770hz = fftshift(S_770hz);
figure;
subplot(2,1,1);
plot(freq,S_f);
title('Espectro do sinal composto de três componentes senoidais');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);
subplot(2,1,2);
plot(freq, S_770hz);
title('Componente do sinal de 770 Hz filtrado com passa-faixa Butterworth.');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);

% Filtro de 852Hz Butterworth
Num = [
     0.000000000007674623107715503777944271234; 0; 
    -0.000000000030698492430862015111777084937; 0; 
     0.000000000046047738646293025898839895191; 0;
    -0.000000000030698492430862015111777084937; 0; 
     0.000000000007674623107715503777944271234 
];

Den = [1; 
    18.723854036105780807019982603378593921661;
   -34.153268845102040529582154704257845878601; 
    41.404068891609767888439819216728210449219;
   -34.07899654791336274683999363332986831665 ; 
    18.642505949254868369280302431434392929077; 
    -6.22711645042142070138879716978408396244;  
     0.991329630860964927663303569715935736895 
];


s_852hz = filter(Num, Den, s_t);
S_852hz = fft(s_852hz);
S_852hz = abs(2*S_852hz /L);
S_852hz  = fftshift(S_852hz );
figure;
subplot(2,1,1);
plot(freq,S_f);
title('Espectro do sinal composto de três componentes senoidais');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);
subplot(2,1,2);
plot(freq, S_852hz );
title('Componente do sinal de 852 Hz filtrado com passa-faixa Butterworth.');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);

% Filtro de 940Hz Butterworth
Num = [0.000000000007698496068837793746781982269; 0;
    -0.000000000030793984275351174987127929078; 0; 
     0.000000000046190976413026762480691893617; 0;
    -0.000000000030793984275351174987127929078; 0; 
     0.000000000007698496068837793746781982269 
];
Den = [1; 
     -5.902149339413338857696089689852669835091; 
     17.054552786823688137474164250306785106659;
    -30.518120678802585388211809913627803325653; 
     36.783803548311759357147820992395281791687;
    -30.451702102949198547321429941803216934204;; 
     16.980399695100125256885803537443280220032; 
     -5.863697447546361019021787797100841999054;  
      0.991322918116968265778155000589322298765
];

s_940hz = filter(Num, Den, s_t);
S_940hz = fft(s_940hz);
S_940hz = abs(2*S_940hz/L);
S_940hz = fftshift(S_940hz);
figure;
subplot(2,1,1);
plot(freq,S_f);
title('Espectro do sinal composto de três componentes senoidais');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);
subplot(2,1,2);
plot(freq, S_940hz);
title('Componente do sinal de 940 Hz filtrado com passa-faixa Butterworth.');
xlabel('Frequência (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
ylim([-0.1 1.1]);