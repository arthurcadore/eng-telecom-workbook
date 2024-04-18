
 ;-------------------------------------------------
 ; Autor: Arthur Cadore Matuella Barcella
 ;-------------------------------------------------

;DEFINIÇÕES
 .equ ON = PD2
 .equ OFF = PD3
 .equ L0 = PB0
 .equ L1 = PB1
 .def AUX = R16

.ORG 0x0000 ; Reset vector
 RJMP setup

 .ORG 0x0002 ; Vetor (endereço na Flash) da INT0
 RJMP altera_ON
 
 .ORG 0x0004 ; Vetor (endereço na Flash) da INT1
 RJMP altera_OFF

 .ORG 0x0034 ; primeira end. livre depois dos vetores
 
 setup:
    
 ldi AUX,0x03 ; 0b00000011
 out DDRB,AUX ; Configura PB3/2 como saída
 out PORTB,AUX ; Desliga os LEDs
 
 cbi DDRD, ON ; Configura o PD2 como entrada
 cbi DDRD, OFF ; Configura o PD3 como entrada

 sbi PORTD, ON ; Liga o pull-up do PD2
 sbi PORTD, OFF ; Liga o pull-up do PD3

 LDI AUX, 0b00000100 ;
 STS EICRA, AUX ; config. INT0 sensível a borda
 SBI EIMSK, INT0 ; habilita a INT0
 SBI EIMSK, INT1 ; habilita a INT1

 SEI ; habilita a interrução.

 main:
    
 sbi PORTB,L0 ; Desliga L0
 
 ldi r19, 80
 rcall delay ; Delay 1s
 
 cbi PORTB,L0 ; Liga L0
 
 ldi r19, 80
 rcall delay ; Delay 1s
 
 rjmp main


 ;-------------------------------------------------
 ; Rotina de Interrupção "altera_ON":
 ;-------------------------------------------------
 
 altera_ON:
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16

 sbic PIND,ON ; botao 1 pressionado -> Salta a próxima instrução
 rjmp fim1
 
 ; Intrução de ligar o LED;
 cbi PORTB,L1 ; Liga L1
 rjmp fim1
 
 ; Restaurar os valores e retornar de onde interrompeu; 
 fim1:
 pop R16 ; Restaura o contexto (SREG)
 out SREG,R16
 pop R16
 reti ; retorna da interrupcao
 
 
 ;-------------------------------------------------
 ; Rotina de Interrupção "altera_OFF":
 ;-------------------------------------------------

 altera_OFF:
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16

 sbic PIND,OFF ; botao 1 pressionado -> Salta a próxima instrução
 rjmp fim2
 
 ; Intrução de desligar o LED;
 sbi PORTB,L1 ; Liga L1
 rjmp fim2 

 ; Restaurar os valores e retornar de onde interrompeu; 
 fim2:
 pop R16 ; Restaura o contexto (SREG)
 out SREG,R16
 pop R16
 reti ; retorna da interrupcao


;--------------------------------------------------------------
;SUB-ROTINA DE ATRASO Programavel
; Depende do valor de R19 carregado antes da chamada.
;--------------------------------------------------------------

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
 
loopdelay:
    
dec R17 ;decrementa R17, inicia em com 0x00
brne loopdelay ;enquanto R17 > 0 fica decrementando R17
dec R18 ;decrementa R18, inicia em com 0x00
brne loopdelay ;enquanto R18 > 0 volta decrementar R18
dec R19 ;decrementa R19
brne loopdelay ;enquanto R19 > 0 vai para volta o incio
    
; Restaura os valores de SREG,
pop r17
out SREG, r17

; Restaura os valores dos registradores R17 e R18
pop r18 
pop r17
    
ret