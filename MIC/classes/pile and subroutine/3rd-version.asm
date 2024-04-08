; Nomeia os pinos destinados aos botões;
.equ BOTAO_AJUSTE = PB0  
.equ BOTAO_SELECAO = PB1
    
; Define o valor dos delays das subrotinas
.equ DELAY0 = 16
.equ DELAY1 = 80
    
;Define o registrador R16 com o nome de AUX
.def AUX = R16 
   
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
    LDI AUX, 0b11111111
    OUT PORTD, AUX

; laço de verificação do botão de seleção
adjustPressed:
   
    ;verifica se o botão ajuste foi pressionado (se for falso avança para o proximo laço)
    sbic PINB,BOTAO_AJUSTE 
    rjmp selectPressed 
    
    ;Carrega o valor 11111111 no R16 para utilizar a rotação. 
    LDI AUX, 0b11111111
    LDI r20, 8
    
    ;Entra na subrotina de leds pressionados "liga led PB0"
    liga_led_PB0:
    
    ;rotaciona um bit e "imprime" nos LEDs 
    ROL AUX
    OUT PORTD, AUX
    
    ; carrega o valor correspondente a 200ms no registrador e realiza o delay
    ldi R19,DELAY0
    rcall delay
    
    ; decrementa em uma unidade o registrador auxiliar o loop, e segue o laço.
    DEC r20
    CPI r20, 0
    BREQ selectPressed
    rjmp liga_led_PB0
       
; laço de verificação do botão de seleção.
selectPressed:
    
    ;verifica se o botão seleção foi pressionado (se for falso avança para o laço de limpeza)
    sbic PINB,BOTAO_SELECAO 
    rjmp ledclear 
    
    ;Carrega o valor 11111111 no R16 para utilizar a rotação. 
    LDI AUX, 0b11111111
    LDI r20, 8
    
    ;Entra na subrotina de leds pressionados "liga led PB1"
    liga_led_PB1:
    
    ;rotaciona um bit e "imprime" nos LEDs 
    ROR AUX
    OUT PORTD, AUX
    
    ; carrega o valor correspondente a 1000ms no registrador e realiza o delay
    ldi R19,DELAY1
    rcall delay
    
    ; decrementa em uma unidade o registrador auxiliar o loop, e segue o laço.
    DEC r20
    CPI r20, 0
    BREQ ledclear
    rjmp liga_led_PB1
    
; volta para o laço de limpeza dos leds.
 rjmp ledclear
 
delay: 
    
 ; Salva os valores dos registradores R17 e R18
 push r17 
 push r18 
 
 ; Salva os valores de SREG no registrador R17 para salva-lo
 in r17,SREG 
 push r17 
 
;Limpa o conteúdo do registrador R17 e R18
clr r17 
clr r18
 
 
loop:
    
dec R17 ;decrementa R17, inicia em com 0x00
brne loop ;enquanto R17 > 0 fica decrementando R17
dec R18 ;decrementa R18, inicia em com 0x00
brne loop ;enquanto R18 > 0 volta decrementar R18
dec R19 ;decrementa R19
brne loop ;enquanto R19 > 0 vai para volta o incio
    
; Restaura os valores de SREG,
pop r17
out SREG, r17

; Restaura os valores dos registradores R17 e R18
pop r18 
pop r17
    
ret