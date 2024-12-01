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
  date: "25 de Novembro de 2024",
  doc,
)

= Introdução 

Neste documento, serão apresentados os modelos de Entidade-Relacionamento (ER) para as questões propostas. Os modelos foram elaborados com base nas informações fornecidas em cada questão.

= Questões

== Questão 1

Em se considerando instituições de ensino, deseja-se armazenar os dados de servidores, professores e alunos. Note-se que estes dados são individualizados, ou seja, se um professor for aluno o armazenamento se dará como duas instâncias em separado, porém pode-se manter informações centralizadas por questões históricas. Sabe-se que todos os considerados possuem características em comum, como nome, CPF e data de nascimento. 

Quanto ao relacionamento com a instituição, para os servidores e  professores é importante saber-se a data de ingresso e o salário atual;
para os alunos deve-se saber a data de ingresso mas também o curso o qual fora iniciado em tal data, assim como também para os professores. Ou seja, o aluno e o professor possuem relacionamento individual, com matrícula própria, para cada curso que venham a cursar ou lecionar. De cada curso têm-se informações básicas, como nome, data de início e ramo de atividade, sendo os mesmos identificados por nome. 

Cada curso possui diversas disciplinas, as quais os alunos devem cursar, com informação de ano e semestre cursado, bem como informação de se está ativamente cursando ou se já cursou e, se já cursou, a nota obtida. Os professores também devem ter armazenado informações sobre disciplinas lecionadas e semestre/ano no qual lecionaram. Os alunos podem cursar quaisquer disciplinas, independente do curso no qual estão inscritos no momento. Note-se que é preciso armazenar-se também informação de se o aluno obteve nota e frequência suficientes na disciplina quando cursada. 

Neste modelo as pessoas envolvidas podem obter dados históricos
correlacionados de se já cursaram diversos cursos e se são ou foram professores ou servidores da instituição, tudo em uma única conta. Adicione atributos como considerar necessário ao modelo.

=== Diagrama ER Teórico

#figure(
  figure(
    rect(image("./diagrams/diagram1.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Questão 2

Considere um modelo para representar construtoras, onde têm-se informações das mesmas, como CNPJ e razão social. Este tipo de empresa possui diversos funcionários, os quais podem ou não possuir especializações. As especializações podem ser sobrepostas, sendo as mesmas engenheiro civil e arquiteto. Os engenheiros possuem  identificação de registro CREA enquanto os arquitetos possuem registro CAU. 

A empresa possui diversas obras, as quais são de um tipo, o qual deve ter sua tipificação bem definida, como prédio residencial, prédio comercial, condomínio, etc. Cada obra possui número de apartamentos, endereço, status da obra, uma descrição extra, arquitetos e engenheiros responsáveis e outros funcionários relacionados à obra. Cada obra deve possuir também histórico de ocorrências tipificadas e, em tais ocorrências, é preciso se ter listados todos os funcionários envolvidos em tal. 

Exemplos de ocorrências envolvem desde atrasos individuais ou faltas até acidentes envolvendo diversos funcionários. Estas ocorrências devem possuir data e valor de custo envolvido com a mesma. Cada apartamento de uma obra deve possuir informações como número de quartos, bloco, número do apartamento e informação de se já foi vendido ou não -
note-se que algumas destas informações podem ser obtidas de maneira relacional. 

E, em caso de venda, deve-se armazenar informações do proprietário, como nome, CPF, telefone, etc. Sinta-se livre para definições “maiores”, caso julgue necessário, como definição de prédios como parte de um condomínio. Adicione atributos como se estivesse realizando uma resolução real para um cliente como, por exemplo, salário de cada funcionário e período no qual trabalhou em cada obra.

=== Diagrama ER Teórico

#figure(
  figure(
    rect(image("./diagrams/diagram2.svg")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
