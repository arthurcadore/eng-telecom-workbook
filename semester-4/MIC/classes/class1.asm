;--------------------------------------------------------------
;Autor: ARTHUR CADORE M. BARCELLA
;--------------------------------------------------------------    
 
 .DSEG
 .ORG SRAM_START
 
 LEDs: .BYTE 10
 .CSEG  
    
; Definições:
 .def AUX = R16
 .equ DP = PC5   
 
 setup:
    
 LDI YH, HIGH(LEDs)
 LDI YL, LOW(LEDs)
 LDI R17, 10
 LDI AUX, 9
 
 ; Faz a inicialização do GPIO.
 rcall ssd_init
 
 ; Carrega um incrementador de 1 á 12 dentro das posições de memória
 setupLoop:
     
 ST Y+, R16
 dec R16
 dec R17
 CPI R17, 0
 BREQ mainSetup
 rjmp setupLoop
     
 
;---------------------------------------------------------------------------
; PROGRAMA PRINCIPAL
;---------------------------------------------------------------------------

 mainSetup:
    
 LDI XH, HIGH(LEDs)
 LDI XL, LOW(LEDs)
 LDI AUX, 0

 ; Loop do programa principal;
 mainLoop:
   
 ; Incrementa o valor de AUX a cada rodada de interção
 INC AUX
 
 ;Chama a sub-rotina ssd_write_x para a impressão. 
 rcall ssd_write_x
 
 ; delay de 200ms
 ldi R19, 16
 rcall delay
 
 ; Compara se já foram feitos 10 ciclos (11 pelo incremento inicial).
 CPI AUX, 10
 
 ; Avança para o botão caso tenha feito 10 ciclos, caso não volta para o loop.
 BREQ botaoPisca
 
 rjmp mainLoop
 
 botaoPisca:

 ; liga o botão DP, aguarda 1s e desliga o botão.
 rcall ssd_dp_on
 ldi R19, 80
 rcall delay
 rcall ssd_dp_off
  
 rjmp mainSetup
    
;---------------------------------------------------------------------------
; FIM DO PROGRAMA PRINCIPAL
;---------------------------------------------------------------------------



;---------------------------------------------------------------------------
; SUB-ROTINA: inicializa as portas para o leds e botões (GPIO)
;---------------------------------------------------------------------------
ssd_init: 
 push AUX ; Salva o contexto (SREG)
 in AUX, SREG
 push AUX

; Configuração das portas: 
 ldi AUX,0xFF 
 out DDRB,AUX ; Configura todas as portas como saída
 out DDRC,AUX ; Configura todas as portas como saída

 out PORTB,AUX ; Desliga os LEDs
 out PORTC,AUX ; Desliga os LEDs

 pop AUX ; Restaura o contexto (SREG)
 out SREG,AUX
 pop AUX
 ret

 
;---------------------------------------------------------------------------
; SUB-ROTINA: inicializa as portas para o leds e botões (GPIO)
;---------------------------------------------------------------------------
ssd_write_x:
 push AUX ; Salva o contexto (SREG)
 in AUX, SREG
 push AUX 
    
; Carrega o valor do ponteiro X no registrador R16 (AUX).
 ld AUX, X+
; Imprime o valor do AUX na saida
 rcall ssd_decode
 
 pop AUX ; Restaura o contexto (SREG)
 out SREG,AUX
 pop AUX  
ret

;---------------------------------------------------------------------------
; SUB-ROTINA:  Sub-rotina que desliga o DP (ponto do display).
;---------------------------------------------------------------------------

ssd_dp_off:
sbi PORTC,DP ; Desliga o led do ponto
ret

;---------------------------------------------------------------------------
; SUB-ROTINA:  Sub-rotina que liga o DP (ponto do display).
;---------------------------------------------------------------------------

ssd_dp_on:
cbi PORTC,DP; liga o led do ponto
ret


;---------------------------------------------------------------------------
; SUB-ROTINA: Decodifica um valor de 0 a 15 passado como parâmetro no R16 e 
;             escreve em um display anodo comum com a seguinte ligação:
; Seguimento:  G   F  ...  A
; Pino:       PB2 PC5 ... PC0
;---------------------------------------------------------------------------
ssd_decode:
  push ZH            ; Guarda contexto
  push ZL        
  push r0        
  in r0,SREG   
  push r0      

  ldi  ZH,HIGH(Tabela<<1) 
  ldi  ZL,LOW(Tabela<<1)  
  add  ZL,R16             
  brcc le_tab             
  inc  ZH    

le_tab:     
  lpm  R0,Z      ; Lê tabela de decoficação

  sbi PORTC, PC4 ; Escreve G
  sbrs R0, 6
  cbi PORTC, PC4

  out PORTB, R0  ; Escreve A .. F      

  pop r0         ; Recupera contexto
  out SREG, r0
  pop r0
  pop ZL
  pop ZH    

  ret

;---------------------------------------------------------------------------
;   Tabela p/ decodificar o display: como cada endereço da memória flash é 
; de 16 bits, acessa-se a parte baixa e alta na decodificação
;---------------------------------------------------------------------------
Tabela: .dw 0x7940, 0x3024, 0x1219, 0x7802, 0x1800, 0x0308, 0x2146, 0x0E06
;             1 0     3 2     5 4     7 6     9 8     B A     D C     F E  
;===========================================================================



;---------------------------------------------------------------
;SUB-ROTINA DE ATRASO Programável
; Descrição: Depende do valor de R19 carregado antes da chamada.
; Exemplos:  - R19 = 16 --> 200ms 
;            - R19 = 80 --> 1s 
;---------------------------------------------------------------
delay:           
  push r17       ; Salva os valores de r17,
  push r18       ; ... r18,
  in r17,SREG    ; ...
  push r17       ; ... e SREG na pilha.

  ; Executa sub-rotina :
  clr r17
  clr r18
loop:            
  dec  R17       ;decrementa R17, começa com 0x00
  brne loop      ;enquanto R17 > 0 fica decrementando R17
  dec  R18       ;decrementa R18, começa com 0x00
  brne loop      ;enquanto R18 > 0 volta decrementar R18
  dec  R19       ;decrementa R19
  brne loop      ;enquanto R19 > 0 vai para volta

  pop r17         
  out SREG, r17  ; Restaura os valores de SREG,
  pop r18        ; ... r18
  pop r17        ; ... r17 da pilha

  ret