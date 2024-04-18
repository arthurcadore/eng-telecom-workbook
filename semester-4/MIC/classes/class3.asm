.DSEG
.ORG SRAM_START
    
; Cria um vetor com 6 posições de memória
Vetor: .BYTE 6
 
.CSEG   
;Define o registrador R16 com o nome de AUX
.def AUX = R16 
   
; Nomeia os pinos destinados aos botões;
.equ BOTAO = PD2  
    
; Nomeia os pinos destinados aos LEDs como "PORTA"
.equ PORTA0 = PB0
.equ PORTA1 = PB1
.equ PORTA2 = PB2
.equ PORTA3 = PB3
.equ PORTA4 = PB4
.equ PORTA5 = PB5
    
;laço de setup
setup:
    
    ;carrega AUX com o valor 0x00 (para entrada)
    LDI AUX,0b00000000 
    OUT DDRD, AUX
    
    ;carrega AUX com o valor 0x11
    LDI AUX,0b11111111
    
     ;habilita o pull-up para os botões
    OUT PORTD,AUX  
     
   ;habilita os pinos de LEDs como saída.
    OUT DDRB, AUX
    
    ;Desliga todas as portas correspondente aos LEDs
    SBI PORTB, PORTA0 
    SBI PORTB, PORTA1 
    SBI PORTB, PORTA2
    SBI PORTB, PORTA3 
    SBI PORTB, PORTA4 
    SBI PORTB, PORTA5 
   
; laço para carregar os valores no vetor.
    VetorSetup:
     
    ; utiliza o ponteiro Y para referênciar o inicio do vetor.
    LDI YH, HIGH(Vetor)
    LDI YL, LOW(Vetor)
    
    ; inicia o registrador auxiliar com 1 
    LDI AUX, 1
   
    ; Carrega um incrementador de 1 á 12 dentro das posições de memória
    VetorLoop:

    ; guarda o valor do registrador aux, e duplica seu valor
    ST Y+, AUX
    ADD AUX, AUX
   
    ; compara o valor de aux para sai do loop quando estiver carregado. 
    CPI AUX, 64
    BREQ loopSetup
    rjmp VetorLoop
    
loopSetup:
    
    ; referencia o vetor com o ponteiro X
    LDI XH, HIGH(Vetor)
    LDI XL, LOW(Vetor)
    
    ; Carrega o valor 1 no registrador auxiliar
    LDI AUX, 1
  
    botaoLigado: 
    ; verifica se o botão está ligado, caso não esteja pula para o proximo laço 
    sbic PIND,BOTAO
    rjmp botaoDesligado 
    
    ; incrementa o valor do registrador.
    INC AUX
    
    ; carrega o valor do vetor em R17 e avança uma posição
    ld R17, X+
    
    ; imprime o valor de R17 nos pinos dos LEDs 
    OUT PORTB, R17
        
    ; compara se o laço ocorreu 8 vezes para sair do laço. 
    ; caso saida do laço, reconfigura para iniciar do zero
    CPI AUX, 8
    BREQ loopSetup 
    
    ; laço para botão desligado
    botaoDesligado: 
    
    ; verifica se o botão foi desligado, caso não esteja, fica preso no loop.
    ; quando o botão for desligado, volta para o laço de verificação de botão ligado.
    sbis PIND,BOTAO
    rjmp botaoDesligado 
       
    rjmp botaoLigado