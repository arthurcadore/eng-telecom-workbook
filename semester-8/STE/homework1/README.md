# Atividade 1 - Arthur Cadore

![MainLogo](./pictures/diagram.svg)


# Sistemas Embarcados - Contato Inicial

Utilize o kit com Arduino entregue a você para implementar um programa com as seguintes especificações.

## Voltímetro Digital

1. Monte um circuito com um Arduino, dois botões e um potenciômetro de 10kohm.

2. Implemente um software de uma aplicação de voltímetro digital usando a arquitetura de Fila de Funções com as seguintes tarefas:
  * Tratamento de entrada dos botões Hold e Scale através de interrupções. O botão Hold controla se a saída deve ser atualizada ou não, e o botão Scale alterna a escala da saída do voltímetro entre Volts (V) e mili-Volts (mV).
  * Tratamento da entrada do conversor analógico-digital (potenciômetro) - esta tarefa deve realizar a 10 leituras consecutivas e assumir a média destas leituras como a medida realizada.
  
  * Utilizar a biblioteca TimerOne do Arduino (https://www.arduino.cc/reference/en/libraries/timerone/) para implementar um tratador de eventos periódico que atualize a entrada analógica e gere saída via porta Serial a cada 500ms, conforme a lógica da aplicação (lembre-se do botão Hold).

3. O código-fonte e a documentação do seu trabalho devem estar no GitHub. A documentação deve estar no arquivo README.md (pode substituir este enunciado), e deve incluir o esquema elétrico utilizado (lembre-se: esquema elétrico não é foto da montagem nem imagem do protoboard).
