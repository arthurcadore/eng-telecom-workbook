#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Relatório - Simulação de Rede com Eventos Discretos",
  subtitle: "Explicação do Código e Resultados",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "13 de Maio de 2025",
  doc,
)

= Introdução

Este relatório apresenta a explicação detalhada do código Python desenvolvido para simulação de uma rede com eventos discretos, incluindo comentários sobre cada função, lógica empregada e a importância da geração de números exponenciais. Também são apresentados os resultados gráficos gerados pelo script.

= Estrutura do Código

O código está organizado em classes e funções para modularidade e clareza. A seguir, cada parte é explicada:

== Parâmetros Globais

Os parâmetros globais definem as características da simulação, como taxa de transmissão, delay de propagação, tamanho da fila, tempo total de simulação, etc.

== Classe Event

Classe base para todos os eventos da simulação. Define a interface e a ordenação dos eventos na fila de prioridade.

== Classe Simulator

Gerencia o tempo, a fila de eventos e as entidades (estações) da simulação. Possui métodos para agendar eventos e executar a simulação até o tempo final.

== Classe ExponentialGenerator

Esta classe encapsula a geração de números aleatórios com distribuição exponencial, fundamental para modelar o tempo entre chegadas de eventos em processos Poisson. Utiliza o método da inversa: $X = -1/lambda * ln(U)$, onde $U ~ U(0,1)$.

A distribuição exponencial é essencial em simulações de redes, pois representa o tempo entre chegadas de pacotes. Ao encapsular em uma classe, o código fica mais modular e testável.

== Eventos de Chegada de Pacotes (PacketArrivalA e PacketArrivalB)

- PacketArrivalA: Modela a chegada de pacotes na estação A, usando a geração exponencial.
- PacketArrivalB: Modela a chegada de pacotes na estação B, com intervalo fixo.

== Eventos de Transmissão (TransmissionStart, TransmissionEnd)

- TransmissionStart: Inicia a transmissão de um pacote, checando colisões.
- TransmissionEnd: Finaliza a transmissão e agenda a próxima, se houver.

== Evento de Backoff

Modela o tempo de espera aleatório após uma colisão, antes de tentar retransmitir.

== Classe Station

Representa uma estação transmissora, com fila de pacotes, histórico de transmissões e registro de backoffs.

== Funções de Plotagem

As funções plot_results e plot_exponential_generation geram e salvam gráficos dos resultados da simulação e da geração exponencial, respectivamente.

== Função main

Inicializa a simulação, agenda os eventos iniciais e executa os plots.

= Comentários no Código

#sourcecode[```Python
# (O código Python está completamente comentado no arquivo homework.py)
```
]

= Resultados Gráficos

== Colisões ao longo do tempo
#sourcecode[```python
plot_results(sim)  # Função responsável por gerar e salvar o gráfico de colisões
```
]
#figure(
  figure(
    rect(image("./pictures/colisoes.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Colisões ao longo do tempo], position: top)
)

== Vazão por estação
#sourcecode[```python
plot_results(sim)  # Função responsável por gerar e salvar o gráfico de vazão
```
]
#figure(
  figure(
    rect(image("./pictures/vazao.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Vazão de cada estação ao longo do tempo], position: top)
)

== Backoffs ao longo do tempo
#sourcecode[```python
plot_results(sim)  # Função responsável por gerar e salvar o gráfico de backoffs
```
]
#figure(
  figure(
    rect(image("./pictures/backoffs.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Backoffs ao longo do tempo], position: top)
)

\text[justify]{
\strong{Observação:} No gráfico acima, observa-se que a estação A não apresenta backoffs ao longo do tempo. Isso ocorre porque, devido à natureza do tráfego gerado (processo Poisson com intervalos aleatórios), a estação A frequentemente fica com a fila vazia ou transmite em momentos em que não há sobreposição com a estação B, que gera pacotes em intervalos fixos. Assim, as colisões e, consequentemente, os backoffs, tendem a ocorrer apenas para a estação B, que está sempre transmitindo. Para forçar colisões em ambas, seria necessário ajustar os parâmetros para garantir concorrência mais frequente entre as transmissões das duas estações.
}

== Geração Exponencial
#sourcecode[```python
plot_exponential_generation(lambd=2.0, n_samples=10000)
```
]
#figure(
  figure(
    rect(image("./pictures/exponencial.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Histograma e QQ-plot da geração exponencial], position: top)
)

== Geração Uniforme
#sourcecode[```python
plot_uniform_generation(n_samples=10000)
```
]
$
U_(n+1) = (a * U_n + c) mod m
$

$
X_n = U_n/m
$
#figure(
  figure(
    rect(image("./pictures/uniforme.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Histograma e QQ-plot da geração uniforme], position: top)
)

= Conclusão

O código apresentado permite simular o funcionamento de uma rede com eventos discretos, modelando colisões, backoffs e vazão de estações. A geração de números exponenciais é fundamental para simular processos Poisson, comuns em redes de computadores. Os gráficos gerados ilustram o comportamento do sistema e validam a implementação. 