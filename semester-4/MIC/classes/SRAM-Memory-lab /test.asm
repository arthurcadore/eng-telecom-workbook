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
    
    ;Entra na subrotina de leds pressionados "liga led PB0"

    liga_led_PB0:
    
    ldi R19,16
    
    rcall delay
    CBI PORTD, PORTA0
    rcall delay
    CBI PORTD, PORTA1 
    rcall delay
    CBI PORTD, PORTA2 
    rcall delay
    CBI PORTD, PORTA3 
    rcall delay
    CBI PORTD, PORTA4 
    rcall delay
    CBI PORTD, PORTA5 
    rcall delay
    CBI PORTD, PORTA6 
    rcall delay
    CBI PORTD, PORTA7 
    rcall delay
    
; laço de verificação do botão de seleção.
selectPressed:
    
    ;verifica se o botão seleção foi pressionado (se for falso avança para o laço de limpeza)
    sbic PINB,BOTAO_SELECAO 
    rjmp ledclear 
    
    ;Entra na subrotina de leds pressionados "liga led PB1"
     liga_led_PB1:
    
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA7
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA6 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA5 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA4 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA3 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA2 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA1 
    ldi R19,16
    rcall delay
    CBI PORTD, PORTA0 
    ldi R19,16
    rcall delay
    
; volta para o laço de limpeza dos leds.
 rjmp ledclear
 

delay:
dec R17 ;decrementa R17, come¸ca com 0x00
brne delay ;enquanto R17 > 0 fica decrementando R17
dec R18 ;decrementa R18, come¸ca com 0x00
brne delay ;enquanto R18 > 0 volta decrementar R18
dec R19 ;decrementa R19
brne delay ;enquanto R19 > 0 vai para volta
ret
    