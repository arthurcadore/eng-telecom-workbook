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
  title: "Modelagem de Protocolo de Transferência de Arquivos",
  subtitle: "Projeto de Protocolos",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "27 de Setembro de 2024",
  doc,
)


= Introdução

O objetivo deste documento é apresentar o protocolo TFTP (Trivial File Transfer Protocol) que é um protocolo de transferência de arquivos que utiliza o protocolo UDP (User Datagram Protocol) para a transferência de arquivos entre um cliente e um servidor.

= Serviço Oferecido pelo Protocolo

O TFTP é um protocolo de transferência de arquivos que permite a transferência de arquivos entre um cliente e um servidor. O protocolo TFTP é um protocolo simples e eficiente, porém, não possui mecanismos de autenticação e criptografia, sendo assim, é utilizado em ambientes onde a segurança não é uma prioridade. Um exemplo de transferencia de arquivo que usa deste protocolo é o boot remoto de um computador aplicado em redes locais, envio de arquivo de configurção automatizada para equipamentos de rede e atualização de firmware de equipamentos de rede.

= Características do canal de comunicação

O protocolo TFTP utiliza o protocolo UDP (User Datagram Protocol) para a transferência de arquivos entre um cliente e um servidor. Como o UDP não possui mecanismos de controle de erros e de conexão, o protocolo TFTP implementa esse mecanismos através da mensageria de ACK no momento em que o cliente recebe um pacote de dados do servidor, além do controle de sequencia dos blocos para garantir que todos os pacotes de dados sejam entregues corretamente.

O controle deste protocolo é feito através dos blocos de dados que são enviados pelo servidor para o cliente. O cliente envia uma mensagem de requisição para o servidor, o servidor responde com um bloco de dados, o cliente envia uma mensagem de ACK para o servidor, o servidor responde com um bloco de dados e assim por diante até que o arquivo seja transferido por completo.

O tamanho de cada bloco pode ser configurado (padrão 512 bytes) através da option "BlkSize" que é enviada pelo cliente no momento da requisição do arquivo. Entretanto o tamanho máximo de um bloco é de 65464 bytes. Além de que cada bloco de dados é numerado sequencialmente, começando em 1 e indo até 65535: 

#figure(
  figure(
    rect(image("./pictures/blksize.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Desta forma, é possivel calcular o tamanho máximo do arquivo que pode ser transferido através do protocolo TFTP, pelo produto do tamanho do bloco de dados pelo número máximo de blocos que podem ser enviados: 

$
T_m = 64"kB" * 65535 = 4.194.240"kB" = 4.194,24"MB"
$

Quando o arquivo é maior que o tamanho máximo definido entre as partes (cliente e servidor), é necessário reiniciar a contagem de blocos de dados, entretanto essa configuração depende da implementação do protocolo e também o servidor, no MikroTik por exemplo, o servidor apenas permite essa recontagem caso a opção "Allow Rollback" esteja habilitada.

= Conjunto de mensagens do protocolo

As mensagens do protocolo TFTP são divididas em quatro tipos:

== RRQ

A mensagem de requisição de arquivo (RRQ) é enviada pelo cliente para o servidor para solicitar um arquivo. A mensagem de requisição de arquivo contém o nome do arquivo que o cliente deseja transferir, o modo de transferência (ASCII ou binário) e a opção de tamanho do bloco de dados: 


#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== WRQ

Em seguida, o servidor responde com uma mensagem de requisição de escrita (WRQ) que contém o nome do arquivo que o cliente deseja transferir, o modo de transferência (ASCII ou binário) e a opção de tamanho do bloco de dados:

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== DATA

Em seguida, o servidor envia um bloco de dados (DATA) para o cliente que contém parte do arquivo que está sendo transferido. O bloco de dados contém o número do bloco, o bloco de dados e o tamanho do bloco de dados:

#figure(
  figure(
    rect(image("./pictures/3.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== ACK 

Por fim, o cliente envia uma mensagem de ACK para o servidor para confirmar a recepção do bloco de dados. A mensagem de ACK contém o número do bloco que foi recebido:

#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== DATA (LAST BLOCK)

Ao final da transferencia, o servidor envia um bloco de dados (DATA) para o cliente que contém o último bloco do arquivo que está sendo transferido. O bloco de dados contém o número do bloco, o bloco de dados e o tamanho do bloco de dados:

#figure(
  figure(
    rect(image("./pictures/LAST.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Sintaxe e Codificação das Mensagens


A mensagem é codificada em ASCII e é composta por um opcode de 2 bytes que indica o tipo de mensagem, seguido por um campo de dados que contém o nome do arquivo que está sendo transferido, em seguida o número do bloco de dados, os dados em si, e ao final dos dados, o terminador de linha (0x00) que indica o fim da mensagem.

#figure(
  figure(
    rect(image("./pictures/message.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Modelo de comportamento do protocolo

Como descrito no próprio escopo da atividade, o servidor aguarda uma requisição de arquivo do cliente na porta 69/UDP. 

Quando o cliente envia uma requisição de arquivo (RRQ) para o servidor, o servidor responde com uma mensagem de requisição de escrita (WRQ) que contém o nome do arquivo que o cliente deseja transferir, o modo de transferência (ASCII ou binário) e a opção de tamanho do bloco de dados.

Em seguida, o servidor envia um bloco de dados (DATA) para o cliente que contém parte do arquivo que está sendo transferido. O bloco de dados contém o número do bloco, o bloco de dados e o tamanho do bloco de dados.

Por fim, o cliente envia uma mensagem de ACK para o servidor para confirmar a recepção do bloco de dados. A mensagem de ACK contém o número do bloco que foi recebido.

Esse processo se repete até que o arquivo seja transferido por completo. Ao final da transferencia, o servidor envia um bloco de dados (DATA) para o cliente que contém o último bloco do arquivo que está sendo transferido. O bloco de dados contém o número do bloco, o bloco de dados e o tamanho do bloco de dados.

#figure(
  figure(
    rect(image("./pictures/model.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



