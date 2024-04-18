    .DSEG
    .ORG SRAM_START


    ; Parte 1 -----------------------------------------------------------------------
    ;Seta posições de memória conforme solicitado na tarefa

    ; 12 Bytes para A1, A2 e A3
    ; 4 Bytes para A4
    A1: .BYTE 12
    A2: .BYTE 12
    A3: .BYTE 12
    A4: .BYTE 4
    .CSEG
    

    ; Inicia os ponteiros Y apontando para A2
    A2setup:
     
    LDI YH, HIGH(A2)
    LDI YL, LOW(A2)
    LDI R16, 1
   
    ; Carrega um incrementador de 1 á 12 dentro das posições de memória
    A2loop:
 
    ST Y+, R16
    INC R16
    CPI R16, 13
    BREQ A3setup
    rjmp A2loop
    
    ; Inicia os ponteiros Y apontando para A3
    ; Carrega o valor 13 no registrador R16
    A3setup: 
    
    LDI YH, HIGH(A3)
    LDI YL, LOW(A3)
    LDI R16, 1
    
    ; Carrega um decrementador de 12 á 1 dentro das posições de memória
    A3loop: 
   
    ST Y+, R16
    INC R16
    CPI R16, 13
    BREQ A1setup
    rjmp A3loop

    ; Parte 2 -----------------------------------------------------------------------
    
    ; Inicia os ponteiros X apontando para A2
    ; Inicia os ponteiros Y apontando para A3
    ; Inicia os ponteiros Z apontando para A1
    
    A1setup: 
    
    ldi XH, HIGH(A1) 
    ldi XL, LOW(A1)
   
    ldi ZH, HIGH(A2)
    ldi ZL, LOW(A2)
    
    ldi R17, 1
       

    ; Carrega o valor de X e Y em dois registradores auxiliares para a soma
    ; Faz a soma dos registradores 
    ; Guarda o valor somado dentro da posição apontada pelo ponteiro Z (No caso, as posições de A1)
    ; Compara o valor 
    IncrementLoop:
      

    ld r0, -Y
    ld r1, Z+

    add r0, r1
    
    ST X+, r0
    INC R17
  
    CPI R17, 13
    BREQ ThirdPart
    rjmp IncrementLoop
   

    ; Parte 3 -----------------------------------------------------------------------

    ; Inicia os ponteiros X apontando para A1
    ; Inicia os ponteiros Y apontando para A3
    ; Inicia os ponteiros Z apontando para A2
    
    ThirdPart: 
    
    ldi YH, HIGH(A3) 
    ldi YL, LOW(A3)
    
    ldi ZH, HIGH(A2)
    ldi ZL, LOW(A2)
    
    ldi XH, HIGH(A4) 
    ldi XL, LOW(A4)
    
    ; Some A2(3) e A3(4) e guarde em A4(0)
    ldd r0, Z+2
    ldd r1, Y+3
    
    add r0, r1
    
    st X+, r0
    
    ; Some A2(5) e A3(7) e guarde em A4(1)
    ldd r0, Z+4
    ldd r1, Y+6
    
    add r0, r1
    
    st X+, r0
    
    ; Some A2(8) e A3(6) e guarde em A4(2)
    ldd r0, Z+7
    ldd r1, Y+5
    
    add r0, r1
    
    st X+, r0
    
    ; Some A2(10) e A3(12) e guarde em A4(3)
    ldd r0, Z+9
    ldd r1, Y+11
    
    add r0, r1
    
    st X, r0
    
    rjmp A2setup
 
