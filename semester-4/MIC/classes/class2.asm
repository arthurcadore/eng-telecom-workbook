.INCLUDE <m328Pdef.inc>
 
.DSEG
.ORG SRAM_START
    
A: .BYTE 1

.CSEG
 
.ORG 0x0000 ; Reset vector
 RJMP setup
 
.ORG 0x0020 ; Vetor (endere¸co na Flash) do estouro doT/C0
 RJMP isr_tc0b 
 
.ORG 0x0002 ; Vetor (endere¸co na Flash) da INT0
 RJMP isr_int0
 
.ORG 0x0034 ; primeira end. livre depois dos vetores
 
setup:    
    ; Configura a PD2 como entrada com o pull-up ativo
    cbi DDRD, PD2
    sbi PORTD, PD2

    ; Inicializa o SSD
    sbi DDRC, PC4	    ; Configura PC5 (segmento G) como saída ...
    sbi PORTC, PC4	    ; ... e apaga 
    sbi DDRC, PC5	    ; Configura PC6 (DP) como saída ...
    sbi PORTc, PC5	    ; ... e apaga 
    
    ldi R17,0xFF	  
    out DDRB, R17	    ; configura PBx como saída ...
    out PORTB, R17	    ; ... e apaga os segmentos do display
       
    ; Configurando a interupção base;
    LDI r16, 0x01 ;
    STS EICRA, r16 ; config. INT0 sens´ıvel a borda
    SBI EIMSK, INT0 ; habilita a INT0
    
    ;Configurado contador paralelo
    ldi R18, 0b00000101 ;TC0 com prescaler de 1024, a 16 MHz gera
    out TCCR0B, R18; uma interrup¸c~aoa cada 16,384 ms
    LDI R18, 1
    sts TIMSK0, R18; habilita int. do TC0B(TIMSK0(0)=TOIE0 <- 1)
    
    SEI ; habilita a interrup¸c~ao glo
        
    clr r16
    clr r17
    clr r18
   

main: 
   rjmp main
    
;-------------------------------------------------
; Rotina do contador paralelo a CPU: 
;-------------------------------------------------
 isr_tc0b:
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16
 
 inc r18
 cpi r18, 124
 brne fim
 
 lds r16, A 
 rcall ssd_decode; depois de entrar 124 vezes na interrup¸c~ao: 124* 16,384 ms= 2.015,81ms
 inc r16
 sts A, r16
 ldi r18,0
 
 ; Quando o r16 chega a 10, reinicia a contagem.
 cpi r16,10
 brne fim
 ldi r16,0
 sts A, r16
 
fim:
 
 pop R16 ; Restaura o contexto (SREG)
 out SREG,R16
 pop R16
 reti

;---------------------------------------------------------------------------
; SUB-ROTINA DE INTERRUPÇÃO: 
;---------------------------------------------------------------------------
isr_int0:
    
 push R16 ; Salva o contexto (SREG)
 in R16, SREG
 push R16
 
 lds r16, A 
 clr r16
 sts A, r16
 rcall ssd_decode
     
 pop R16 ; Restaura o contexto (SREG)
 out SREG,R16
 pop R16 ;Restaura o valor do registrador;
 
reti 
  
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
  push r17	     ; Salva os valores de r17,
  push r18	     ; ... r18,
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