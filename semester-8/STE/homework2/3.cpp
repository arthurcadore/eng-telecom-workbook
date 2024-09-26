const int SCALE_PIN = 2; 
const int HOLD_PIN = 3;
const int ANALOG_PIN = 0; 
const int PWM_PIN = 5;
const float VCC = 5;
const float ADC_TOP = 1023;

int scale;
int hold;
int read; 
float saida; 
long next_isr;

void trata_repique(int pin){
  detachInterrupt(digitalPinToInterrupt(pin));
  next_isr = micros() + 800000;
}

void verifica_isrs(int pin, void (*isr)(void)){
  if(micros() >= next_isr){
   // attachInterrupt(digitalPinToInterrupt(pin));
   attachInterrupt(digitalPinToInterrupt(pin),
                                          isr,
                                        RISING);
  }
}

void scale_isr(){
    Serial.println("Botão Scale pressionado");
    scale = !scale;
    trata_repique(SCALE_PIN);
}

void hold_isr(){
    Serial.println("Botão Hold pressionado");
    hold = !hold;
    trata_repique(HOLD_PIN);
}


void setup()
{
  pinMode(SCALE_PIN, INPUT);
  pinMode(HOLD_PIN, INPUT);
  Serial.begin(9600);

  scale = 0;
  hold = 1;

  attachInterrupt(digitalPinToInterrupt(SCALE_PIN),
                                          scale_isr,
                                        RISING);
    
  attachInterrupt(digitalPinToInterrupt(HOLD_PIN),
                                          hold_isr,
                                        RISING);
}

void le_entradas(){
    read = analogRead(ANALOG_PIN);
}

void atualiza_saidas(){
    if ( hold == 1 ){
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

void loop()
{
    le_entradas();
    atualiza_saidas();
    verifica_isrs(SCALE_PIN, scale_isr);
    verifica_isrs(HOLD_PIN, hold_isr);
    delay(100);
}