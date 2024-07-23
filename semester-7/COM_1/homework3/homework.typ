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
\
- Objetivo: Introduzir os conceitos de sinais reais e complexos e sua representação em termos de senos e cossenos.

O processamento de sinais lida com sinais reais do mundo físico, como sinais de tensão analógicos que representam. Esses sinais variam ao longo do tempo e podem assumir valores positivos e negativos.
\

Um exemplo de sinal análogico, é oque é recebido por uma antena, que gera um sinal de tensão em resposta ao campo eletromagnético induzido ao seu redor, ou microfone captando ondas sonoras, e assim gerando um sinal de tensão analógico em resposta às variações na pressão do ar. 
\

Em sistemas de comunicação analogicos e digitais, os sinais são frequentemente representados através de uma soma de exponenciais complexas, contudo, os sinais complexos não existam efetivamente no mundo real, porem, são representados assim na matemática para facilitar as operações e manipulações/conclusões, mas são usados apenas para fins de análise, ou seja, nenhum sinal puramente complexo (imaginário) é gerado ou transmitido na prática.
\

Para ilustrar sua importância, o texto do autor sugere tentar derivar as equações trigonométricas dos sinais analógicos sem a utilização de sinais complexos, e assim, perceber a dificuldade e a complexidade que seria necessária para realizar esse tipo de manipulação.

=== Item 5.4 (Quadrature Modulation and Demodulation (QAM)
\
- Objetivo: Apresentar a modulação e demodulação em quadratura (QAM) e sua aplicação em sistemas de comunicação.
\
Nesta sessão, entramos no ponto de representação 'complexa', onde podemos introduzir a demodulação de amplitude em quadratura (QAM) realizada pelo RTL-SDR. 
\

O objetivo da transmissão em QAM é alcançar uma tecnica de modulação mais eficiente em largura de banda, em outras palavras, consumir (idealmente) a mesma largura no espectro elétromagnético para encaminhar mais informação. 
\

Podemos utilizar como exemplo a modulação em quadratura, onde transmitimos dois sinais de largura de tensão, ambos modulados na mesma frequência de portadora, mas com a fase da portadora separada por 90°, sendo um uma onda senoidal e a outra uma onda cossenoidal (por convenção são snais de seno e cosseno, para que a representação complexa seja a mais simples possivel). 

=== Item 5.5 (Quadrature Amplitude Modulation using Complex Notation)
\
- Objetivo: Apresentar a modulação de amplitude em quadratura (QAM) usando notação complexa.
\
Nesta sessão do livro, o autor apresenta a notação complexa para simplificar a análise matemática de um sistema QAM (Quadrature Amplitude Modulation). Inicialmente, é observado que o sistema QAM é composto apenas por sinais reais (ou seja, sem a adição de componentes imaginários), e, portanto, não utiliza notação complexa. 
\

No entanto, ao introduzir a notação complexa, o equacionamento e tratamento dos sinais se torna mais fácil, pois podemos decompor o sinal em uma soma de componentes complexos. 
\

=== Item 5.6 (Quadrature Amplitude Demodulation using Complex Notation)
\
- Objetivo: Apresentar a demodulação de amplitude em quadratura (QAM) usando notação complexa.


Nesta sessão, é descrito que o processo de demodulação do sinal QAM também pode ser convenientemente expresso usando notação de sinais complexos. 
Isto é, após a multiplicação do sinal, o sinal recebido no receptor pode ser representado por uma função base (que identifica o sinal modulante) multiplicado por um deslocamento na frequência através da multiplicação de uma exponencial complexa.

=== Item 5.7 (Spectral Representation for Complex Demodulation)
\
- Objetivo: Apresentar a representação espectral para a demodulação complexa.
\
Nesta sessão, o autor descreve o processo de modulação e demodulação de sinais complexos, onde são utilizados sinais reais independentes para formar um sinal complexo. Apartir do sinal complexo gerado, são aplicadas transformadas de Fourier (FFT) para analisar os espectros de magnitude dos sinais.
\

Durante a modulação, o sinal modulante é deslocado em frequência para ser centrado em torno de uma frequência específica (a frequência da portadora). Já no processo de demodulação, os sinais real e imaginário são filtrados por um filtro (tipicamente um filtro passa-baixas, por ser mais simples que um passa faixas, e portanto mais barato), com as especificações de frequeência e ordem adequadas para recuperar o sinal modulante complexo. 

=== Item 5.8 (Frequency Offset Error and Correction at the Receiver)
\
- Objetivo: Apresentar o erro de deslocamento de frequência e sua correção no receptor.
\
Nesta sessão, texto apresenta um possível erro no receptor devido a 
ao desvio de frequência em relação a frequência ideal para recepção do sinal modulado. 
\

Esse desvio é ilustrado na equação de demodulação do receptor, que é modificada para compensar esse erro, de maneira em que o receptor se sintonize novamente com a frequência central onde o sinal está sendo transmitido. 
\

De acordo com o autor, este tipo de erro é comum em receptores RTL-SDR, onde a frequência de recepção pode ser desviada por algumas centenas de Hz ou até kHz devido a tolerâncias nos componentes do receptor que variam as impedâncias imaginárias causando descasamento, portanto, sendo necessário um ajuste compensar este erro em software. 

=== Item 5.9 (Frequency Correction using a Complex Exponential)
\
- Objetivo: Apresentar a correção de frequência usando uma exponencial complexa.
\
Nesta sessão, o autor explica sobre a coreção de frequência comentada na sessão anterior para compensar casos de desvio de frequência, através da multiplicação do sinal complexo de entrada no receptor por um valor específico complexo.
\

Em seguida, o ajuste do desvio pode incluir ajuste da fase do sinal da portadora, sincronização e/ou seções de temporização, seguidas pelas seções de decodificação do sinal, porem, as etapas que o sinal sofrerá para ser ajustado irão depender do tipo de sinal que está tentando ser captado. 
\

Nesta sessão o autor também comenta que deve-se notar sobre as orientações passadas serem válidas para cenários idealizados. Ou seja, as operações realizadas assumem operações matemáticas perfeitas e ignora os efeitos do mundo real ao transmitir o sinal no meio. No entanto, essas operações são úteis para entender o processo de ajuste de frequência e a correção de erros de desvio de frequência.

=== Item 5.10 (RTL-SDR Quadrature / Complex Architecture)
\
- Objetivo: Apresentar a arquitetura quadratura/complexa do RTL-SDR.
\
Nesta sessão, o autor descreve a arquitetura do RTL-SDR, que é um receptor de software definido que utiliza modulação em quadratura para receber sinais de rádio.
\
Primeiro descreve o processo de modulação e transmissão pelo meio de comunicação (no caso de RadioFrequência, o meio wireless). Em seguida, no lado do receptor, descreve sobre o sinal sendo recebido e demodulado pelo circuito RTL-SDR, e depois passado para algum interpretador de sinais, como o MATLAB ou Simulink. 
\

Neste ponto, as amostras lidas no MATLAB ou Simulink correspondem ao sinal de saída (sinal demodulado), e podem ser lidas e compreendidas através de ilustrações do modelo de sistema apresentado na Figura 5 do livro. 

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
\

Inicialmente, foi feita a importação dos sinais de áudio que serão utilizados como modulante para transmissão. Em seguida, foi feita a transposição e corte dos sinais de áudio para transformar em vetores com a mesma amplitude. 
\ 

Em seguida, foi calculado o vetor de tempo a partir do tamanho do menor sinal, e a FFT dos sinais de entrada foi calculada para amostrar seu estado no domínio da frequência.
\ 

Por fim, foi plotado os sinais de entrada no domínio do tempo e da frequência, para visualizar a amplitude e a distribuição de frequência dos sinais modulantes.


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

Uma vez com os sinais de entrada (modulantes) importados e seus respectivos sinais gerados, podemos criar os sinais de portadora para a transmissão de maneira ortogonal.

Em seguida foi realizada a modulação AM dos sinais de áudio com sua respectiva portadora (seno e cosseno), e posteriormente, a multiplexação dos sinais foi realizada somando os sinais modulados. 

Após a multiplexação, o sinal no dominio do tempo foi plotado no domínio do tempo e da frequência, para visualizar a amplitude e a distribuição de frequência do sinal multiplexado.

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

Uma vez com o sinal multiplexado gerado, simulando que o sinal foi transmitido pelo meio físico e recebido no receptor, é necessário realizar a demodulação do sinal.
\

Para isso, no receptor o sinal é multiplicado novamente pelo sinal da portadora correspondente a cada sinal modulante, e posteriormente, um filtro FIR é aplicado para garantir que o sinal seja limpo e que a informação possa ser extraída de maneira correta.
\

Em seguida, para podermos aproveitar o sinal recebido, precisamos realizar uma filtragem para retirar qualquer possivel ruído que possa ter sido adicionado durante a transmissão. 
\

Para isso, definimos um filtro passa baixa (20KHz) de alta ordem (100) para realizar a filtragem do sinal demodulado. Para visualizarmos se o filtro corresponde as especificações necessárias, um plot da resposta em frequência do filtro FIR para cada sinal demodulado foi realizado.

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
\
Uma vez com o filtro FIR definido, podemos aplicar a filtragem do sinal demodulado para garantir que a informação seja extraída de maneira correta. 


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
\
Em seguida, os dois sinais demodulados no dominio do tempo foram comparados com os sinais de entrada, para verificar se a informação foi corretamente modulada, transmitida e demodulada, e portanto, se a informação foi preservada. 

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

= Conclusão
\
A partir dos conceitos vistos e dos resultados apresentados, podemos concluir que a modulação IQ é uma técnica eficiente para a transmissão de dados, pois permite a transmissão de dois sinais distintos na mesma frequência sem interferência (idealmente), ao mesmo tempo em que é uma técnica razoavelmente simples de ser implementada, pois necessita apenas de dois sinais ortogonais base para agir como portadora.

Desta forma, a modulação IQ permitiu a transmissão dos dois sinais de áudio pela mesma frequência de tranmissão base (40000Hz), sem que houvesse interferência entre os sinais (idealmente), e portanto, aproveitando de melhor maneira o espectro elétromagnético.

Assim podemos compreender o motivo pela qual essa técnica de transmissão por ortogonalidade vem sido aplicada nas tecnologias mais atuais de transmissão wireless como OFDM e OFDMA, pela capacidade de aproveitar da melhor maneira possivel o espectro eletromagnético disponível, e portanto, transmitir mais dados em menos tempo e com menos interferência.

= Referências
\
Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:
\
\
- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]