#include "fifo.h"

typedef void (*FuncPtr_t)(void);

typedef Fifo<FuncPtr_t, 10> FuncFifo;
FuncFifo fqueue;

const int BTN1_PIN = 2; 
const int BTN2_PIN = 3;

void task1(){
    Serial.println("Tarefa 1");
}

void task2(){
    Serial.println("Tarefa 2");
}


void btn1_isr(){
    // create a cast to void* to avoid warning
    fqueue.Push(task1);
}


void btn2_isr(){
    fqueue.Push(task1);
    fqueue.Push(task2);
}

void setup()
{
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(BTN1_PIN), btn1_isr, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN2_PIN), btn2_isr, RISING);
  Serial.println("Setup");

}

void loop()
{
    Serial.println("loop");

    FuncPtr_t task;
    if(fqueue.Pop(&task) == FuncFifo::FIFO_SUCCESS){
    task();
    };
    delay(500);
}