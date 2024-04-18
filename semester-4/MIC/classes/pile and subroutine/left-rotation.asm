 .DSEG
 .ORG SRAM_START
 
  LEDs: .BYTE 16
  .CSEG  
; Nomeia os pinos destinados aos botões;
.equ BOTAO_AJUSTE = PB0  
.equ BOTAO_SELECAO = PB1
    
; Define o valor dos delays das subrotinas
.equ DELAY0 = 16
    
;Define o registrador R16 com o nome de AUX
.def AUX = R16 
   
;laço de setup
setup:
       
    ;habilita os pinos de LEDs como saída.
    LDI AUX,0xFF 
    OUT DDRD, AUX
    
    STS LEDs, AUX
    LDI AUX, 0x00
    IN AUX, SREG
    STS LEDs+1, AUX
    
loop: 
         
   rcall leftRotation
   rjmp loop
   
leftRotation: 
    
 push r17 
 push r18 
 
 ; Salva os valores de SREG no registrador R17 para salva-lo
 in r17,SREG 
 push r17 
 
;Limpa o conteúdo do registrador R17 e R18
clr r17 
clr r18
 
  ; ------------------------------------------------
    
 LDI YH, HIGH(LEDs)
 LDI YL, LOW(LEDs)
 
 LD R17, Y
 LDD R18, Y+1
 OUT SREG, R18
 
 ROR R17
 OUT PORTD, R17
 LDI R19, DELAY0
 rcall delay

 STS LEDs, R17
 IN R18, SREG
 STS LEDs+1, R18

 ; Restaura os valores de SREG,
pop r17
out SREG, r17

; Restaura os valores dos registradores R17 e R18
pop r18 
pop r17
    
ret

 
 
 
 
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

