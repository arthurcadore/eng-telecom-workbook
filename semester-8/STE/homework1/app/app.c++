/* 
    Author: Arthur Cadore M. Bacella
    IFSC - Campus São José
*/

// importing libraries
#include "fifo.h"
#include <TimerOne.h>

// defining function pointer
typedef void (*FuncPtr_t)(void);

// defining Fifo for interruption task order. 
typedef Fifo<FuncPtr_t, 10> FuncFifo;
FuncFifo fqueue;

// defining pins
const int BTN1_PIN = 2; 
const int BTN2_PIN = 3;
const int ANALOG_PIN = 0; 

// defining constants parameters
const float VCC = 5;
const float ADC_TOP = 1023;

// defining global variables
int scale;
int hold;
int read; 
float saida;

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

/*
    Function to change the scale of the output
*/
void task1(){
    Serial.println("Botão de Escala Pressionado!");
    scale = !scale;
}

/*
    Function to change the hold of the output
*/
void task2(){
    Serial.println("Botão de Hold Pressionado!");
    hold = !hold;
}

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

/*
    Function to setup the timer and the interruptions
*/
void setup()
{
  // initialize the timer, and set the interruptions to 500ms
  Timer1.initialize(500000);
  Timer1.attachInterrupt(Timer);

  // initialize the serial communication
  Serial.begin(9600);
  Serial.println("Setup");

  // initalize the pins and set it to be interruptions
  attachInterrupt(digitalPinToInterrupt(BTN1_PIN), btn1_isr, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN2_PIN), btn2_isr, RISING);

}

/*
    Function to loop the tasks
*/
void loop()
{
    // define the function pointer
    FuncPtr_t task;

    // check if there is any task to be executed
    if(fqueue.Pop(&task) == FuncFifo::FIFO_SUCCESS){
        // execute the task
        task();
    };
}

/*
    Function to be called by the timer
*/
void Timer() {
    // added the tasks to the queue to be executed
    fqueue.Push(media_pot);
    fqueue.Push(atualiza_saidas);
}