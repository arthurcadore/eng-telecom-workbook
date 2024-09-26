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

void scale_isr(){
    Serial.println("Botão Scale pressionado");
    scale = !scale;
}

void hold_isr(){
    Serial.println("Botão Hold pressionado");
    hold = !hold;
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
      saida = (read/ADC_TOP)*VCC; 
      Serial.print("\"Tensao\":");
      Serial.print(saida);
    if(scale == 1){
      Serial.println(" mV");
    }else {
      Serial.println(" V");
    }
  }
}

void loop()
{
    le_entradas();
    atualiza_saidas();
    delay(100);
}