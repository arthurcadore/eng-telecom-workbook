#include <cppQueue.h>


const int BTN1_PIN = 2; 
const int BTN2_PIN = 3;

typedef void (*FuncPtr_t)(void);

cppQueue fqueue(sizeof(FuncPtr_t), 10, FIFO);

void task1(){
    Serial.println("Tarefa 1");
}

void task2(){
    Serial.println("Tarefa 2");
}


void btn1_isr(){
    // create a cast to void* to avoid warning
    fqueue.push((void*)task1);
}


void btn2_isr(){
    fqueue.push((void*)task1);
    fqueue.push((void*)task2);
}

void setup()
{
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(BTN1_PIN), btn1_isr, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN2_PIN), btn2_isr, RISING);

  fqueue.push(&btn1_isr);
  fqueue.push(&btn2_isr);
}

void loop()
{
    void * func; 
    fqueue.pop(&func);
    
    // return void pointer to function pointer
    FuncPtr_t task = (FuncPtr_t)func;
    task();
}