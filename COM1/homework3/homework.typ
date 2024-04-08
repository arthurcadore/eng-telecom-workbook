#import "@preview/klaro-ifsc-sj:0.1.0": report

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
Seção III - Apresentação e comentários dos gráfios/figuras das etapas de desenvolvimento do relatório

= Scripts e Codigos
\
Seção IV -  Scripts e Codigos

= Conclusões
\
Seção V - Conclusões

= Referências
\
Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:
\
\
- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]