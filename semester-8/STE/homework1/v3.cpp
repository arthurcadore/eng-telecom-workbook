const int SCALE_PIN = 8; 
const int HOLD_PIN = 7;
const int ANALOG_PIN = 0; 

void setup()
{
  pinMode(SCALE_PIN, INPUT);
  pinMode(HOLD_PIN, INPUT);
  Serial.begin(9600);
}

void loop()
{
  int scale = digitalRead(SCALE_PIN);
  int hold = digitalRead(HOLD_PIN);
  int read = analogRead(ANALOG_PIN);
  
  float saida = float(read/1024.0)*5; 
  Serial.print("Amostrado: ");
  Serial.println(read);
  Serial.print("Tensão: ");
  Serial.println(saida);  
}