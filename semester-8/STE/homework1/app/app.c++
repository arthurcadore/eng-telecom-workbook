#include "fifo.h"
#include <TimerOne.h>

typedef void (*FuncPtr_t)(void);

typedef Fifo<FuncPtr_t, 10> FuncFifo;
FuncFifo fqueue;

const int BTN1_PIN = 2; 
const int BTN2_PIN = 3;
const int ANALOG_PIN = 0; 

const float VCC = 5;
const float ADC_TOP = 1023;

int scale;
int hold;
int read; 
float saida;

void atualiza_saidas(){
    if ( hold == 0 ){
      Serial.print("\"Tensao\":");
        if(scale == 1){
          saida = (read/ADC_TOP)*VCC*1000; 
          Serial.print(saida);
          Serial.println(" mV");
        }else {
          saida = (read/ADC_TOP)*VCC; 
          Serial.print(saida);
          Serial.println(" V");
        }
  }
}

void media_pot(){
    int pot_vector[10];
    int soma = 0; 

    for (int i = 0; i < 10; i++) {
        pot_vector[i] = analogRead(ANALOG_PIN);
    }

    // Soma os valores do vetor
    for (int i = 0; i < 10; i++) {
        soma += pot_vector[i];
    }

    read = (soma / 10); 

    Serial.print("A média dos valores é: ");
    Serial.println(read);

}

void task1(){
    Serial.println("Botão de Escala Pressionado!");
    scale = !scale;
}

void task2(){
    Serial.println("Botão de Hold Pressionado!");
    hold = !hold;
}


void btn1_isr(){
    fqueue.Push(task1);
}


void btn2_isr(){
    fqueue.Push(task2);
}

void setup()
{
  Timer1.initialize(500000);
  Timer1.attachInterrupt(Timer);
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(BTN1_PIN), btn1_isr, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN2_PIN), btn2_isr, RISING);
  Serial.println("Setup");

}

void loop()
{
    FuncPtr_t task;
    if(fqueue.Pop(&task) == FuncFifo::FIFO_SUCCESS){
    task();
    };
}

void Timer() {
    fqueue.Push(media_pot);
    fqueue.Push(atualiza_saidas);
}