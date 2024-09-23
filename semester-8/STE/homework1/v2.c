const int SCALE_PIN = 8; 
const int HOLD_PIN = 7;
const int ANALOG_PIN = 0; 
const int PWM_PIN = 3;
const float VCC = 5;
const float ADC_TOP = 1023;

void setPWM(float valor) {
  // Verifica se o valor está dentro do intervalo permitido (0 a 1023)
  if (valor < 0) {
    valor = 0;
  } else if (valor > ADC_TOP) {
    valor = ADC_TOP;
  }

  // Mapeia o valor (0 - 1023) para a faixa de PWM (0 - 255)
  int pwmValue = map(valor, 0, ADC_TOP, 0, 255);

  // Define o PWM no pino 3
  analogWrite(3, pwmValue);
}
void setup()
{
  pinMode(SCALE_PIN, INPUT);
  pinMode(HOLD_PIN, INPUT);
  pinMode(PWM_PIN, OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  int scale = digitalRead(SCALE_PIN);
  int hold = digitalRead(HOLD_PIN);
  int read = analogRead(ANALOG_PIN);
  
  float saida = (read/ADC_TOP)*VCC; 
  Serial.print("Amostrado: ");
  Serial.println(read);
  Serial.print("Tensão: ");
  Serial.println(saida);  
  setPWM(read);
}