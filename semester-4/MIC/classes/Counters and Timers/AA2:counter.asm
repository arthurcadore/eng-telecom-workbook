;-------------------------------------------------
; Autor: Arthur Cadore Matuella Barcella
;-------------------------------------------------

.DSEG
.ORG SRAM_START
    
contagem: .BYTE 1
intervalo: .BYTE 1
 
.CSEG
 ;DEFINIÇÕES
 .equ BOTAO = PD2
 .equ L0 = PB5
 .def AUX = R16

.ORG 0x0000 ; Reset vector
 RJMP setup
 
 .ORG 0x0020 ; Vetor (endere¸co na Flash) do estouro doT/C0
 RJMP isr_tc0b 

 .ORG 0x0004 ; Vetor (endereço na Flash) da INT1
 RJMP isr_int1

 .ORG 0x0034 ; primeira end. livre depois dos vetores
 
 setup:
    
 sbi DDRB, L0 
 cbi PORTB, L0; desliga led
 
 ldi AUX,0x03 ; 0b00000011
 out DDRB,AUX ; Configura PB5 como saída
 out PORTB,AUX ; Desliga os LEDs
 cbi DDRD, BOTAO ; Configura o PD2 como entrada
 sbi PORTD, BOTAO ; Liga o pull-up do PD2

 LDI AUX, 0b00000100 ;
 STS EICRA, AUX ; config. INT1 sensível a borda
 SBI EIMSK, INT1 ; habilita a INT1
 
 ldi AUX, 0b00000101 ;TC0 com prescaler de 1024, a 16 MHz gera
 out TCCR0B, AUX; uma interrupção cada 16,384 ms
 LDI AUX, 1
 sts TIMSK0, AUX; habilita int. do TC0B(TIMSK0(0)=TOIE0 <- 1)

 SEI ; habilita a interrupção global


 main:
 rjmp main

 ;-------------------------------------------------
 ; Rotina do contador paralelo a CPU: 
 ;-------------------------------------------------
 
 isr_tc0b:
    
 push R16 ; Salva o valor de R16
 in R16, SREG
 push R16 ;Salva o contexto (SREG)
 
 LDI YH, HIGH(contagem)
 LDI YL, LOW(contagem)
 
 LD R16, Y   
 inc r16
 cpi r16, 62
 brne fim1
 sbi PINB, L0; inverteo estado do LED depois de entrar 62 vezes na interrupção: 62* 16,384 ms= 1.015,81ms
 ldi r16,0
 
 ST Y, R16
 
 fim1:
    
 pop R16 ; Restaura o contexto (SREG)
 out SREG,R16
 pop R16 ;Restaura o valor do registrador;
    
 reti
 
 ;-------------------------------------------------
 ; Rotina de Interrupção (ISR) da INT1
 ;-------------------------------------------------
 isr_int1:
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16

 LDI YH, HIGH(intervalo)
 LDI YL, LOW(intervalo)
 
 LDI XH, HIGH(contagem)
 LDI XL, LOW(contagem)
 
 ; Para cada caso abaixo, o R16 é validado para saber qual intervalo deve ser aplicado.
 
 ; Ao selecionar um intervalo, o valor da SRAM é modificado para iniciar neste valor, assim a contagem se mantem nesse valor inicial (ao invés de 0);

 LD R16, Y  
 inc r16
 
 caso1:
 cpi r16, 1
 brne caso2
 
 LDI R17, 32
 ST X, R17
 
 rjmp fim
 
  caso2:
 cpi r16, 2
 brne caso3
 
 LDI R17, 48
 ST X, R17
 
 rjmp fim
 
  caso3:
 cpi r16, 3
 brne caso4
 
 LDI R17, 52
 ST X, R17
 
 rjmp fim
 
  caso4:
 cpi r16, 5
 brne limpar
 
 LDI R17, 56
 ST X, R17
 
 rjmp fim
 
 
 limpar:
    ldi r16, 0

 ; Restaurar os valores e retornar de onde interrompeu; 
 fim:
    
 ST Y, R16
    
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