
; Nomeia os pinos destinados aos botões;
.equ BOTAO_AJUSTE = PB0  
.equ BOTAO_SELECAO = PB1
    
;Define o registrador R16 com o nome de AUX
.def AUX = R16 
   
; Nomeia os pinos destinados aos LEDs como "PORTA"
.equ PORTA0 = PD0
.equ PORTA1 = PD1
.equ PORTA2 = PD2
.equ PORTA3 = PD3
.equ PORTA4 = PD4
.equ PORTA5 = PD5
.equ PORTA6 = PD6
.equ PORTA7 = PD7
    

;laço de setup
setup:
    
    ;carrega AUX com o valor 0x00 (para entrada)
    LDI AUX,0b00000000 
    OUT DDRB, AUX
    
    ;habilita o pull-up para os botões
    LDI AUX,0b11111111 
    OUT PORTB,AUX  
    
    ;habilita os pinos de LEDs como saída.
    OUT DDRD, AUX
  
;laço de limpeza dos leds;
ledclear: 
    
    ;Desliga todas as portas correspondente aos LEDs
    SBI PORTD, PORTA0 
    SBI PORTD, PORTA1 
    SBI PORTD, PORTA2
    SBI PORTD, PORTA3 
    SBI PORTD, PORTA4 
    SBI PORTD, PORTA5 
    SBI PORTD, PORTA6 
    SBI PORTD, PORTA7 
	   
 
; laço de verificação do botão de seleção
adjustPressed:
   
    ;verifica se o botão ajuste foi pressionado (se for falso avança para o proximo laço)
    sbic PINB,BOTAO_AJUSTE 
    rjmp selectPressed 
    
    ;Liga as portas correspondente aos LEDs mais significativos
    CBI PORTD, PORTA4 
    CBI PORTD, PORTA5 
    CBI PORTD, PORTA6 
    CBI PORTD, PORTA7 
    
; laço de verificação do botão de seleção.
selectPressed:
    
    ;verifica se o botão seleção foi pressionado (se for falso avança para o laço de limpeza)
    sbic PINB,BOTAO_SELECAO 
    rjmp ledclear 
    
    ;Liga as portas correspondente aos LEDs menos significativos
    CBI PORTD, PORTA0 
    CBI PORTD, PORTA1 
    CBI PORTD, PORTA2 
    CBI PORTD, PORTA3 
    
; volta para o laço de limpeza dos leds.
 rjmp ledclear