#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#show: doc => report(
  title: "Modulação de Fase e Quadratura (IQ)",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "07 de Abril de 2024",
  doc,
)

= Introdução
\
O objetivo deste relatório, é apresentar os conceitos teóricos para a transmissão de dados utilizando modulação de fase e quadratura (IQ) através de dois diferentes sinais modulados por senos e cossenos. 
\

Neste relatório, será apresentado a fundamentação teórica, os conceitos teóricos utilizados, a análise dos resultados, os scripts e códigos utilizados, as conclusões e as referências bibliográficas, de maneira em que serão utilizados dois sinais modulantes distintos, o primeiro irá modular um sinal senoidal (que será a portadora) e o segundo irá modular um sinal cossenoidal. 
\

Desta forma, poderemos verificar a eficiecia da modulação IQ na transmissão de dados, utilizando a mesma região do espectro eletromagnético para transmitir dois sinais distintos sem interferência (idealmente).

= Fundamentação teórica

== Principais Conceitos
\
Os principais conceitos teóricos abordados neste relatório são: 

- Modulação (IQ): A modulação IQ é uma técnica de modulação digital que utiliza dois sinais modulados por senos e cossenos de igual fase para transmitir dados idealmente sem interferência. A modulação IQ é amplamente utilizada em sistemas de comunicação modernos, como o 4G e o 5G, devido à sua eficiência espectral e capacidade de transmitir dados de forma confiável.

- Ortogonalidade: A ortogonalidade é um conceito fundamental na modulação IQ, que garante que os sinais modulados por senos e cossenos sejam independentes e não interfiram uns nos outros. Isso permite que os dados sejam transmitidos de forma eficiente e confiável, mesmo em ambientes ruidosos. \

- Sinal Portador: A portadora é o que permite a transmissão do sinal, suas caracteristicas são ideiais para o meio onde a onda irá se propagar, a portadora é influenciada pela modulante de maneira em que o receptor consiga extrair a informação transmitida.

- Sinal Modulante: A modulante é a informação que será transmitida, ela é a responsável por alterar as caracteristicas da portadora, de maneira que o receptor consiga extrair a informação transmitida. 

- Processo de Modulação/Demodulação: O processo de modulação consiste em alterar (normalmente através de multiplicação) as características da portadora de acordo com a modulante, de maneira em que o receptor consiga extrair a informação transmitida. Nos processos de modulação vistos até o momento, realizamos através de mutiplicação (ou no caso da FM, através de integração do argumento de fase).  Já o processo de demodulação consiste em, uma vez com o sinal modulado, transmitido, e recebido no destinatário, extrair a informação do sinal portador, de maneira em que o receptor consiga interpretar a informação transmitida e utiliza-la a nivel de aplicação (como na rádio FM por exemplo, onde a música é recebida interpretada e reproduzida no carro).

== Resumo dos Itens abordados (Material de Referência)
\
Além dos conceitos base apresentados acima, também está abaixo um resumo dos principais conceitos teóricos das sessões 5.1, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9 e 5.10 do livro "Software Defined Radio Using MATLAB & Simulink and the RTL-SDR": 

=== Item 5.1 (Real and Complex Signals — it’s all Sines and Cosines) 

Objetivo: Explorar a representação de sinais reais e complexos na engenharia de sinais, utilizando a fórmula de Euler para simplificar matematicamente a manipulação de sinais em termos de exponenciais complexas.
Conteúdo Principal: Demonstra que, embora operemos com sinais reais no mundo físico (como tensões induzidas por campos eletromagnéticos), a representação complexa dos sinais facilita a análise matemática. A seção se aprofunda na identidade de Euler e na conversão de sinais sinusoidais para sua forma exponencial complexa, permitindo uma manipulação matemática mais simples.

=== Item 5.4 (Quadrature Modulation and Demodulation (QAM)

Objetivo: Introduzir o conceito de modulação em quadratura e demonstrar sua implementação no RTL-SDR.
Conteúdo Principal: Explica a motivação por trás do uso da modulação em quadratura para melhorar a eficiência espectral. Utiliza sinais de exemplo para ilustrar a modulação e demodulação em quadratura, destacando o processo de recuperação de sinais de banda base a partir do sinal recebido.

=== Item 5.5 (Quadrature Amplitude Modulation using Complex Notation)
Objetivo: Descrever a modulação de amplitude em quadratura (QAM) usando notação complexa.
Conteúdo Principal: Detalha como a notação complexa pode simplificar a representação e manipulação de sinais QAM, apresentando um exemplo prático de como os sinais podem ser modulados para transmissão.

=== Item 5.6 (Quadrature Amplitude Demodulation using Complex Notation)
Objetivo: Explorar o processo de demodulação de amplitude em quadratura usando notação complexa.
Conteúdo Principal: Apresenta o método de demodulação QAM, evidenciando como a notação complexa facilita o processo de extração de sinais de banda base do sinal recebido.

=== Item 5.7 (Spectral Representation for Complex Demodulation)
Objetivo: Examinar a representação espectral de sinais complexos e sua aplicação na demodulação.
Conteúdo Principal: Demonstra a transformação espectral de sinais modulados em frequência para sua baseband complexa, detalhando o impacto da modulação complexa nas propriedades espectrais dos sinais.

=== Item 5.8 (Frequency Offset Error and Correction at the Receiver)
Objetivo: Discutir o erro de deslocamento de frequência no receptor e como corrigi-lo.
Conteúdo Principal: Explica o conceito de erro de deslocamento de frequência, suas causas potenciais e métodos para correção, especialmente em relação ao uso do RTL-SDR.

=== Item 5.9 (Frequency Correction using a Complex Exponential)
Objetivo: Descrever um método de correção de frequência usando uma exponencial complexa.
Conteúdo Principal: Apresenta uma técnica para ajustar a frequência de sinais recebidos por meio da multiplicação por uma exponencial complexa, abordando o contexto de sua aplicação prática.

=== Item 5.10 (RTL-SDR Quadrature / Complex Architecture)
Objetivo: Conectar os conceitos de modulação complexa e demodulação com a arquitetura do RTL-SDR.
Conteúdo Principal: Explica como os princípios de modulação e demodulação em quadratura são implementados na arquitetura do RTL-SDR, preparando o terreno para aplicações práticas discutidas nos capítulos seguintes.

= Análise dos resultados
\


Inicialmente, foi feita a importação dos sinais de áudio que serão utilizados como modulantes para a transmissão. Como os sinais de áudio utilizados não possuem exatamente o mesmo comprimento, foram renomeados como *sinal curto* e um *sinal longo*, ambos em formato .wav, e posteriormente através do comprimento dos vetores, um corte foi realizado no sinal com o maior comprimento, para torna-los iguais em termos de duração.
\

A figura abaixo mostra o sinal de áudio curto que será utilizado como modulante da portadora cosseno (em vermelho) e o sinal de áudio longo que será utilizado como modulante da portadora seno (em preto).
\ 

Na figura abaixo também está representado o sinal de áudio curto no domínio da frequência, através da aplicação de uma transformada de Fourier, é possível visualizar a distribuição da amplitude do sinal no espectro de frequência. 

#figure(
  outlined: true,
  image("./pictures/modulante.png", width: 100%),
  caption: [Portadoras geradas e sinal Modulado. \ Figura elaborada pelo autor],
  supplement: "Figura"
);

Em seguida, um sinal de portadora foi gerado a partir da definição de frequência e amplitude do sinal (40000Hz e 1 respectivamente), e posteriormente, a modulação AM foi realizada para cada sinal de áudio, utilizando a portadora correspondente a cada sinal.
\

Neste processo é importante notar que o primeiro sinal de portadora foi gerado a partir de um cosseno, equanto que o segundo sinal de portadora foi gerado a partir de um seno. Essa diferença entre os dois sinais de base é vital para a transmissão dos sinais modulados pelo mesmo meio de transmissão. 
\

Isso ocorre pois os sinais de cosseno e seno são ortogonais entre si, ou seja, não interferem um no outro (idealmente), e por isso, podem ser transmitidos simultaneamente na mesma frequência sem interferência. Caso fosse utilizado dois sinais não ortogonais entre si, haveria interferência entre os mesmos no momento da transmissão no mesmo meio, oque impossibilitaria a distinção entre eles no receptor, e portanto, a informação iria se perder.  



#figure(
  outlined: true,
  image("./pictures/portadora.png", width: 100%),
  caption: [Sinal de Áudio aplicado como modulante \ Figura elaborada pelo autor],
  supplement: "Figura"
);


Uma vez com o sinal modulado, e multiplexado, podemos transmiti-lo pelo meio físico sem que haja interferência entre cada portadora (idealmente). O sinal no meio físico é ilustrado abaixo em azul. 
\

Sua FFT também é apresentada, de maneira em que é possível visualizar a distribuição de frequência dos sinais multiplexados no espectro de frequências. Note que a FFT do sinal multiplexado é a soma das FFTs dos sinais modulados, oque é esperado, pois a modulação neste caso é uma operação linear, e portanto, a FFT do sinal modulado é a soma das FFTs dos sinais modulantes. 
\

Desta forma, é possivel verificar que as amplitudes máximas do sinal multiplexado são mais "largas" do que as de cada sinal modulante individualmente. Isso ocorre pois a soma da FFT dos dois sinais modulantes irá representar uma distribuição de frequência mais ampla do que a de cada sinal modulante individualmente.

#figure(
  outlined: true,
  image("./pictures/multiplexado.png", width: 100%),
  caption: [Sinal de Áudio aplicado como modulante \ Figura elaborada pelo autor],
  supplement: "Figura"
);

Em seguida, com o sinal já transmitido, é necessário realizar sua recepção e demodulação no receptor. Para isso, o sinal é multiplicado pela portadora correspondente a cada sinal modulante (o que está visível no script maltab) que será apresentado mais adiante. 
\

Posteriormente, com o sinal demodulado (ou seja, retornado a sua frequência de banda base), devemos aplicar um filtro no sinal para garantir que o mesmo seja limpo e que a informação possa ser extraída de maneira correta.
\

Para isso, foi utilizado um filtro FIR de ordem relativamente alta (neste caso 100), com frequência de corte de 20kHz. A frequência neste script foi fixada em 20kHz, pois trata-se de um sinal de áudio, e portanto, não há informação relevante acima desta frequência para ser capturada. 
\ 

Para verificar se de fato o filtro está atuando corretamente, foi plotado a resposta em frequência do filtro FIR para cada sinal demodulado, as respostas estão exibidas em vermelho (cosseno) e preto (seno) respectivamente.
\
#figure(
  outlined: true,
  image("./pictures/respostafiltro.png", width: 100%),
  caption: [Sinal de Áudio aplicado como modulante \ Figura elaborada pelo autor],
  supplement: "Figura"
);

\
Com o sinal demodulado e filtrado, podemos verificar se distorções ocorreram indevidamente no sinal, ou se a informação foi corretamente extraída. Para isso, foi plotado o sinal demodulado (coluna esquerda na imagem abaixo) e apenas filtrado para cada sinal modulante (coluna direita na imagem abaixo). 
\

Para garantir que mesmo instante de tempo fosse plotado, um janeamento foi realizado no sinal de entrada, de maneira em que apenas o intervalo de tempo entre 30% e 70% da duração do sinal fosse plotado, assim, está ilustrado o mesmo instante de tempo antes da modulação e após a demodulação do sinal de áudio. 

#figure(
  outlined: true,
  image("./pictures/demodulado.png", width: 100%),
  caption: [Sinal de Áudio aplicado como modulante \ Figura elaborada pelo autor],
  supplement: "Figura"
);

Outro parâmetro importante a ser analisado é a densidade espectral de potência dos sinais modulantes e do sinal multiplexado. Como podemos ver na imagem abaixo, está plotada a densidade dos sinais modulantes (cosseno e seno) e também do sinal multiplexado. 
\

Note que a densidade do sinal multiplexado está deslocada para a direita, isso ocorre pois após a modulação, a frequência do sinal é deslocada para a frequência da portadora, e portanto, a densidade espectral de potência do sinal modulado é deslocada para a frequência da portadora. 

#figure(
  outlined: true,
  image("./pictures/densidade.png", width: 100%),
  caption: [Sinal de Áudio aplicado como modulante \ Figura elaborada pelo autor],
  supplement: "Figura"
);


= Scripts e Codigos
\

Abaixo estão os scripts e códigos utilizados para a realização deste relatório:

== Etapa 1 - Import do sinal e definições: 

#sourcecode[```matlab
% IQ transmission of two diferent audio signals. 
% IQ - In-Phase and Quadrature Modulation

clc; clear all; close all
pkg load signal

% Definição dos parâmetros da portadora do sinal IQ:
carrier_amplitude = 1; 
carrier_frequency = 40000;

% Coletando os sinais para transmissão:
[short_signal, Fs] = audioread('short-signal.wav');
[long_signal, Fs2] = audioread('long-signal.wav');

% Fazendo a transposição linha/coluna do sinal de entrada
short_signal = transpose(short_signal);
long_signal = transpose(long_signal);

% pegando a duração da transmissão a partir do tamanho do menor sinal;
duracao = length(short_signal)/Fs;

% calculando vetor de t no dominio do tempo;
Ts = 1/Fs; 
t=[0:Ts:duracao-Ts];

% Igualando o comprimento dos sinais ao vetor de tempo
signal_cos = short_signal(1:length(t));
signal_sin = long_signal(1:length(t));

% calculando o passo no dominio da frequência; 
f_step = 1/duracao;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f = [-Fs/2:f_step:Fs/2];
f = [1:length(signal_cos)];

% calculando a FFT do sinal de entrada (que será utilizado no cosseno):
signal_cos_F = fft(signal_cos)/length(signal_cos);
signal_cos_F = fftshift(signal_cos_F);

% calculando a FFT do sinal de entrada (que será utilizado no seno):
signal_sin_F = fft(signal_sin)/length(signal_sin);
signal_sin_F = fftshift(signal_sin_F);

% Plot dos sinais de entrada (dominio do tempo e frequência):
figure(1)
subplot(221)
plot(t,signal_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Cosseno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t,signal_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Seno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(f,abs(signal_cos_F), 'r')
title('Sinal Modulante da Portadora Cosseno (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(224)
plot(f,abs(signal_sin_F), 'k')
title('Sinal Modulante da Portadora Seno (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

== Etapa 2 - Modulação IQ dos sinais:

#sourcecode[```matlab

% Criando dos sinais de portadora para transmissão ortogonal (um com seno e outro com cosseno):
carrier_cos = carrier_amplitude*cos(2*pi*carrier_frequency*t);
carrier_sin = carrier_amplitude*sin(2*pi*carrier_frequency*t);

% Realizando a modulação AM do sinal de aúdio na portadora correspondente a cada sinal:
modulated_cos = signal_cos .* carrier_cos; 
modulated_sin = signal_sin .* carrier_sin; 

% Realizando a multiplexação do sinal (a partir do principio de ortogonalidade):
multiplexed_signal = modulated_cos + modulated_sin;

% Calculando a FFT do sinal para amostrar seu estado no dominio da frequência:
multiplexed_signal_F = fft(multiplexed_signal)/length(multiplexed_signal);
multiplexed_signal_F = fftshift(multiplexed_signal_F);

figure(2)
subplot(221)
plot(f,carrier_cos,'r', 'LineWidth', 2)
xlim([0 100*f_step])
title('Portadora Cosseno')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(223)
plot(f,carrier_sin,'k', 'LineWidth', 2)
xlim([0 100*f_step])
title('Portadora Seno')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(222)
plot(t,modulated_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Cossenoidal Modulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(224)
plot(t,modulated_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Senoidal Modulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

% Verificando o sinal multiplexado: 

figure(3)
subplot(211)
plot(t,multiplexed_signal,'b')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal multiplexado')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(212)
plot(f,abs(multiplexed_signal_F), 'b')
title('Sinal multiplexado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

== Etapa 3 - Demodulação dos sinais:


#sourcecode[```matlab
% Realizando a demodulação do sinal no receptor: 

demodulated_cos = multiplexed_signal .* carrier_cos;
demodulated_sin = multiplexed_signal .* carrier_sin;

% Ordem do filtro FIR
filtro_ordem = 100;

% Frequência de corte do filtro FIR 
% Como trata-se de um sinal de áudio, a frequência de corte pode ser fixada em 20kHz
frequencia_corte = 20000;

% Coeficientes do filtro FIR para cada sinal demodulado
coeficientes_filtro = fir1(filtro_ordem, frequencia_corte/(Fs/2));

% Resposta em frequência do filtro FIR para cada sinal demodulado
[H_cos, f_cos] = freqz(coeficientes_filtro, 1, length(t), Fs);
[H_sin, f_sin] = freqz(coeficientes_filtro, 1, length(t), Fs);

% Plot da resposta em frequência dos filtros:
figure(5)
subplot(211)
plot(f_cos, abs(H_cos), 'r', 'LineWidth', 3)
xlim([0 frequencia_corte*1.1])
title('Resposta em Frequência do Filtro FIR Cossenoidal')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(212)
plot(f_sin, abs(H_sin), 'k', 'LineWidth', 3)
xlim([0 frequencia_corte*1.1])
title('Resposta em Frequência do Filtro FIR Senoidal')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

== Etapa 4 - Filtragem: 

#sourcecode[```matlab
% Filtragem dos sinais demodulados
demodulated_cos_filtered = filter(coeficientes_filtro, 1, demodulated_cos);
demodulated_sin_filtered = filter(coeficientes_filtro, 1, demodulated_sin);

% Calculando a FFT dos sinais demodulados para amostrar seu estado no dominio da frequência:
demodulated_sin_F = fft(demodulated_sin_filtered)/length(demodulated_sin_filtered);
demodulated_sin_F = fftshift(demodulated_sin_F);

demodulated_cos_F = fft(demodulated_cos_filtered)/length(demodulated_cos_filtered);
demodulated_cos_F = fftshift(demodulated_cos_F);

% Plot dos sinais demodulados
figure(4)
subplot(221)
plot(t, demodulated_cos_filtered, 'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Cosseno) Demodulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t, demodulated_sin_filtered, 'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Seno) Demodulado Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(f,abs(demodulated_cos_F), 'r')
title('Sinal Modulante (Portadora Cosseno) Demodulado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(224)
plot(f,abs(demodulated_sin_F), 'k')
title('Sinal Modulante (Portadora Seno) Demodulado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

== Etapa 5 - Comparando com o sinal original:

#sourcecode[```matlab
% Comparando sinal transmitido com sinal recebido: 

figure(4)
subplot(221)
plot(t, demodulated_cos_filtered, 'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Cosseno) Demodulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t, demodulated_sin_filtered, 'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Seno) Demodulado Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(t,signal_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Cosseno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(224)
plot(t,signal_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Seno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')
```]

== Etapa 6 - Calculando a densidade espectral de potência:

#sourcecode[```matlab
% Calculando a densidade espectral dos sinais: 
figure(7)
subplot(221)
plot(pwelch(signal_cos), 'r', 'LineWidth', 3);
xlim([0 200])
title('Densidade Espectral do Sinal Modulante (Portadora Cosseno)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
xlim([0 100])

subplot(222)
plot(pwelch(signal_sin), 'k', 'LineWidth', 3);
xlim([0 200])
title('Densidade Espectral do Sinal Modulante (Portadora Seno)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
xlim([0 100])

subplot(2, 2, [3 4])
plot(pwelch(multiplexed_signal), 'b', 'LineWidth', 3);
xlim([0 100])
title('Densidade Espectral do Sinal Multiplexado')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

= Conclusões
\
Seção V - Conclusões

= Referências
\
Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:
\
\
- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]