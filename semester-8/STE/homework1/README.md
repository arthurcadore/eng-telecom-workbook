# Atividade 1 - Arthur Cadore

## Diagrama Elétrico/Eletrônico do circuito: 
![MainLogo](./pictures/diagram.svg)

### Pinagem correspondente apresentada no diagrama: 

- 2: BTN1_PIN
- 3: BTN2_PIN
- 20: ANALOG_PIN0
- 4: GND

## Voltímetro Digital

- [ X ] Monte um circuito com um Arduino, dois botões e um potenciômetro de 10kohm.

- [ X ] Implemente um software de uma aplicação de voltímetro digital usando a arquitetura de Fila de Funções com as seguintes tarefas:

  * [ X ] Tratamento de entrada dos botões Hold e Scale através de interrupções. O botão Hold controla se a saída deve ser atualizada ou não, e o botão Scale alterna a escala da saída do voltímetro entre Volts (V) e mili-Volts (mV).

A atualização é realizada através da função abaixo: 

```c
/*
    Function to update the output values
*/
void atualiza_saidas(){

    // check if hold is not pressed. 
    if ( hold == 0 ){
      Serial.print("\"Tensao\":");

        // check if scale is pressed or not.
        if(scale == 1){
          // if pressed convert to mV
          saida = (read/ADC_TOP)*VCC*1000; 
          Serial.print(saida);
          Serial.println(" mV");
        }else {
          // if not pressed output using V
          saida = (read/ADC_TOP)*VCC; 
          Serial.print(saida);
          Serial.println(" V");
        }
  }
}
``` 
  * [ X ] Tratamento da entrada do conversor analógico-digital (potenciômetro) - esta tarefa deve realizar a 10 leituras consecutivas e assumir a média destas leituras como a medida realizada.

O calculo é realizado através da função abaixo, a qual atualiza a variável global `read`. 
```c
/*
    Function to calculate the average of the potentiometer values
*/
void media_pot(){

    // vector to store the potentiometer values
    int pot_vector[10];
    int soma = 0; 

    // store the potentiometer values in the vector
    for (int i = 0; i < 10; i++) {
        pot_vector[i] = analogRead(ANALOG_PIN);
    }

    // calculate the sum of the values
    for (int i = 0; i < 10; i++) {
        soma += pot_vector[i];
    }

    // calculate the average of the values
    read = (soma / 10); 
}

```

  * [ X ] Utilizar a biblioteca TimerOne do Arduino (https://www.arduino.cc/reference/en/libraries/timerone/) para implementar um tratador de eventos periódico que atualize a entrada analógica e gere saída via porta Serial a cada 500ms, conforme a lógica da aplicação (lembre-se do botão Hold).

Essa etapa é realizada através do conjunto de funções apresentado abaixo, cada task é adicionada a fila de execução pelas interruções no momento em que os botões são pressionados. 

A função timer (executada por interrupção a cada 500ms) também adiciona as funções de tratamento de código a fila de execução para então serem processadas. 

```c
/*
    Function to be called by the interruption when the button 1 is pressed
*/
void btn1_isr(){

    // added the task to the queue to be executed
    fqueue.Push(task1);
}

/*
    Function to be called by the interruption when the button 2 is pressed
*/
void btn2_isr(){
    // added the task to the queue to be executed
    fqueue.Push(task2);
}

void setup()
{
  // initialize the timer, and set the interruptions to 500ms
  Timer1.initialize(500000);
  Timer1.attachInterrupt(Timer);
  [...]
} 

/*
    Function to be called by the timer
*/
void Timer() {
    // added the tasks to the queue to be executed
    fqueue.Push(media_pot);
    fqueue.Push(atualiza_saidas);
}
```

[ X ]. O código-fonte e a documentação do seu trabalho devem estar no GitHub. A documentação deve estar no arquivo README.md (pode substituir este enunciado), e deve incluir o esquema elétrico utilizado (lembre-se: esquema elétrico não é foto da montagem nem imagem do protoboard).
