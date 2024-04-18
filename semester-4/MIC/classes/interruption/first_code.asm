
 ;DEFINIÇÕES
 .equ BOTAO = PD2
 .equ L0 = PB0
 .equ L1 = PB1
 .def AUX = R16

.ORG 0x0000 ; Reset vector
 RJMP setup

 .ORG 0x0002 ; Vetor (endere¸co na Flash) da INT0
 RJMP isr_int0

 .ORG 0x0034 ; primeira end. livre depois dos vetores
 setup:
 ldi AUX,0x03 ; 0b00000011
 out DDRB,AUX ; configura PB3/2 como sa´ıda
 out PORTB,AUX ; desliga os LEDs
 cbi DDRD, BOTAO ; configura o PD2 como entrada
 sbi PORTD, BOTAO ; liga o pull-up do PD2

 LDI AUX, 0x01 ;
 STS EICRA, AUX ; config. INT0 sens´ıvel a borda
 SBI EIMSK, INT0 ; habilita a INT0

 SEI ; habilita a interrup¸c~ao glo


 main:
 sbi PORTB,L0 ; desliga L0
 ldi r19, 80
 rcall delay ; delay 1s
 cbi PORTB,L0 ; liga L0
 ldi r19, 80
 rcall delay ; delay 1s
 rjmp main


 ;-------------------------------------------------
 ; Rotina de Interrupção (ISR) da INT0
 ;-------------------------------------------------
 isr_int0:
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16

 sbic PIND,BOTAO ; botao press. salta a pr´oxima inst.
 rjmp desliga
 cbi PORTB,L1 ; liga L1
 rjmp fim
 desliga:
 sbi PORTB,L1 ; desliga L1

 fim:
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
