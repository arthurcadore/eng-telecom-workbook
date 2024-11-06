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
  title: "Lista de Modelos de ER",
  subtitle: "Banco de dados",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "06 de Novembro de 2024",
  doc,
)

= Introdução 

Neste documento, serão apresentados os modelos de Entidade-Relacionamento (ER) para as questões propostas. Os modelos foram elaborados com base nas informações fornecidas em cada questão.

= Questões

== Questão 1

Um time de futebol possui 11 jogadores e 1 técnico. Uma liga de futebol é composta por 20 times. Em uma temporada da liga de futebol os times jogam entre si no turno e returno, ou seja, no turno o time A joga contra o time B e no returno o time B joga contra o time A. É necessário saber a data que ocorreu cada partida, bem como o placar da partida. Jogadores e treinadores podem trocar de time, porém somente antes de iniciar uma temporada. Ou seja, dentro de uma mesma temporada não ocorrem trocas de times.

=== Diagrama ER Teórico
#figure(
  figure(
    rect(image("./diagrams/q1.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Modelo ER Simplificado
#sourcecode[```markdown

Pessoa(id, nome, dataNasc)

Jogador(id, idPessoa, idTime, idPosicao)
    id, idPessoa, idTime Referencia Pessoa
    idPosicao Referencia Posicao

Tecnico(id, idPessoa, idTime)
    id, idPessoa, idTime Referencia Pessoa

Posicao(idPos, nome, desc)

Jogo(placar, data)

Liga(id, nome, descricao)

Temporada(ano, idliga)
    idliga Referencia Liga

Participacao(id, idTime, idTemporada)
    idTime Referencia Time
    idTemporada Referencia Temporada
 
```]

== Questão 2

Faça um diagrama ER para registrar informações sobre voos comerciais de uma empresa área. Cada
voo possui um número, uma origem, um destino, horário de partida, horário de chegada e distância entre origem e destino. Um voo pode ser executado em diferentes datas e com diferentes aeronaves. Cada aeronave tem um número e é de um modelo específico. Cada modelo de aeronave tem um nome e distância de operação. Cada piloto da empresa área tem um nome, salário, data que ingressou na empresa. Por fim, cada piloto pode estar habilitado a pilotar um ou mais modelos de aeronave.

=== Diagrama ER Teórico

#figure(
  figure(
    rect(image("./diagrams/q2.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Modelo ER Simplificado

#sourcecode[```markdown
piloto (matricula, nome, salario, dataIngress)
    
modelo (idModelo, dist_op, nomeModelo)

pilota (matricula, idModelo)
    idModelo ref. modelo
    matricula ref. piloto

aeronave (numAeronave, idModelo)
    idModelo ref. modelo

voo (numVoo, hPartida, hChegada, distancia, origem, destino)

vooAeronave (data, numAeronave, numVoo)
    numAeronave ref. aeronave
    numVoo ref. voo 
```]

== Questão 3

Construa um diagrama ER para representar um sistema de controle de uma locadora de automóveis. É
desejado registrar os carros disponíveis, quem alugou cada carro, a quilometragem de cada locação, se houve sinistro em uma locação, o início e o término da locação e quais eram os motoristas autorizados a dirigir o veículo em uma locação.

=== Diagrama ER Teórico
#figure(
  figure(
    rect(image("./diagrams/q3.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Modelo ER Simplificado

#sourcecode[```markdown
Carro(chassi, placa, disponivel)

Locador(nome, idLocador)

Motorista (nome, idMotorista)

Locadora (idLocadora, localizacao, cnpj)

Locacao (sinistro, inicio, termino, quilometragem, idLocador, idMotorista, placa, idLocadora)
      idLocador Referencia locador
      idMotorista Referencia motorista
      placa Referencia carro
      idLocadora Referencia locadora
```]


== Questão 4

Somente entidades podem possuir atributos, pois uma entidade é um objeto no mundo real e nos atributos são armazenadas informações que permitem distinguir um objeto de todos os demais. A afirmação anterior é verdadeira ou falsa? Justifique sua resposta por meio de um exemplo.


Resposta: Falso, relacionamentos também podem ter atributos. Por exemplo, em uma aplicação que registra acessos a um servidor web, existem as entidades de Usuário e servidor, e o relacionamento de Acesso. O relacionamento de Acesso pode ter atributos como data e hora do acesso, tempo de duração do acesso, entre outros, como no exemplo abaixo.  

=== Diagrama ER Teórico
#figure(
  figure(
    rect(image("./diagrams/q4.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Modelo ER Simplificado

#sourcecode[```markdown
Servidor(ip, porta, horarioInicializacao)

Usuario(idUsuario, nome, senha)

Acesso(duracao, timestamp, idUsuario, ip, porta)
    idUsuario Referencia Usuario
    ip, porta Referencia Servidor
```]


= Conclusão
