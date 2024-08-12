#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Projeto de Filtros IIR",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "12 de Agosto de 2024",
  doc,
)

= Introdução

= Questão 1

= Questão 2

Crie, usando MATLAB, um sinal de entrada composto de três componentes senoidais, nas frequências 770Hz, 852Hz e 941Hz, com Ωs = 8 kHz. Projete, usando o simulink ou o MATLAB, um filtro IIR para isolar cada componente. Documente as especificações utilizadas. Faça comentários.

== Montagem do Filtro IIR no Simulink: 

O primeiro passo no desenvolvimento da questão foi a montagem do filtro IIR no Simulink seguindo as especificações solicitadas pela questão. Utilizamos a ferramenta para alterar o parâmetros do filtro procurando pelos valores que atendessem as especificações de banda de passagem e de rejeição.

Os valores apresentados abaixo foram obtidos para o filtro de 941Hz, porem, foram realizados mais duas baterias de testes exatamente como as apresentadas abaixo, para as frequências de 770Hz e 852Hz.

=== Resposta em Frequência (Magnitude): 

Inicialmente utilizamos a ferramenta de plot da resposta em frequência do filtro para analisar a magnitude do filtro. A figura abaixo apresenta a resposta em frequência do filtro para a frequência de 941Hz. 

O filtro que estamos procurando precisa possuir uma alta atenuação na banda de rejeição e uma queda abrupta na banda de transição para a banda de rejeição. O filtro abaixo apresenta uma atenuação de aproximadamente 80dB em toda a banda de rejeição. 

#figure(
  figure(
    rect(image("./pictures/q2.1.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Resposta em Frequência (Fase):

A fase do filtro é apresentada na figura abaixo. A fase do filtro é linear e apresenta apenas uma variação de 11° na banda de passagem.

#figure(
  figure(
    rect(image("./pictures/q2.2.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Magnitude e Fase do Filtro:

Abaixo podemos ver a magnitude e a fase do filtro sendo apresentadas juntas, note que a fase é linear dentro da banda de passagem, e a magnitude apresenta uma queda abrupta na banda de transição:

#figure(
  figure(
    rect(image("./pictures/q2.3.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Resposta ao impulso: 



#figure(
  figure(
    rect(image("./pictures/q2.4.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Polos e Zeros do Filtro:

Os polos e zeros do filtro são apresentados na figura abaixo. Note que o filtro possui 4 polos e 4 zeros, e que os polos estão localizados na região de interesse, ou seja, todos os polos estão dentro do círculo unitário. 

Desta forma, o filtro é estável e possui uma resposta ao impulso finita oque é um requisito para o desenvolvimento deste projeto por se tratar de um filtro para sinais digitais. 

#figure(
  figure(
    rect(image("./pictures/q2.5.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Espalhamento de potência do filtro:

Abaixo também está apresentado o espalhamento de potência do filtro. Note que o filtro apresenta uma atenuação de aproximadamente 80dB na banda de rejeição, também é possivel verificar que grande parte da potência do sinal está concentrada na banda de passagem como esperado para as caracteristicas do filtro.

#figure(
  figure(
    rect(image("./pictures/q2.6.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Com base nestes valores, obtivemos os seguintes parâmetros para o filtro de 942Hz:

- Ordem do filtro: 8
- Banda de passagem: 941Hz - 943Hz
- Banda de transição Baixa: 930Hz - 941Hz
- Banda de transição Alta: 943Hz - 954Hz
- Frequência de amostagem: 8kHz
- Astop1 = 40dB
- Astop2 = 60dB
- Método de Desing: IIR-Butterworth

Os mesmos parâmetros foram utilizados para os filtros de 1kHz e 1.1kHz.

== Comparativo entre outros Desings: 

Neste projeto foi decidido utilizar o méotodo de Butterworth para o desing do filtro, porem, também foram testados outros métodos, como Chebyshev: 
#figure(
  figure(
    rect(image("./pictures/q2.7.png")),
    numbering: none,
    caption: [Filtro de 941Hz Utilizando Chebyshev]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Entretanto, durante os testes com os demais filtros, foi visto que a taxa de atenuação apresentada pelo filtro de Butterworth era superior a dos demais filtros, como é possivel verificar acima para o filtro chebyshev em relação ao filtro Butterworth apresentado abaixo.

Note que na banda de passagem, os filtros se assemelham com atenuação proxima de zero e queda abrupta no inicio da banda de rejeição, porem, o filtro Butterworth apresenta uma atenuação de aproximadamente 80dB na banda de rejeição, enquanto o filtro Chebyshev apresenta uma atenuação de até 60dB e em seguida o filtro se mantem constante neste valor por uma faixa de frequência maior, oque atenua menos as componentes espectrais indesejadas.

Desta forma, o filtro que foi escolhido para o projeto e filtragem das componentes cossenoidais, foi o filtro Butterworth.

== Aplicando o filtro no sinal de entrada:

Uma vez com o filtro projetado e os parâmetros definidos, é possivel gerar um script matlab (octave) para gerar as três componentes de entrada, soma-las de maneira a criar um sinal único, análogo ao que seria transmitido pelo meio de transmissão, e aplicar o filtro projetado "no receptor" para cada uma das componentes, separando-as e verificando a resposta em frequência de cada sinal filtrado. 

=== Script Matlab: 
#sourcecode[```matlab
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
```]

=== Resultados Obtidos: 


==== Sinal de Entrada:

#figure(
  figure(
    rect(image("./pictures/q2.8.png")),
    numbering: none,
    caption: [Filtro de 941Hz Utilizando Chebyshev]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

==== Sinal de 770Hz Filtrado:

#figure(
  figure(
    rect(image("./pictures/q2.9.png")),
    numbering: none,
    caption: [Filtro de 941Hz Utilizando Chebyshev]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

==== Sinal de 852Hz Filtrado:


#figure(
  figure(
    rect(image("./pictures/q2.10.png")),
    numbering: none,
    caption: [Filtro de 941Hz Utilizando Chebyshev]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

==== Sinal de 941Hz Filtrado:

#figure(
  figure(
    rect(image("./pictures/q2.11.png")),
    numbering: none,
    caption: [Filtro de 941Hz Utilizando Chebyshev]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



= Conclusão

= Referências