.DSEG
.ORG SRAM_START
A: .BYTE 1
B: .BYTE 1
C: .BYTE 1
 
.CSEG
start:
   
    lds r0, A ;carrega o valor na
    lds r1, B
    
    add r0, r1
    
    sts C, r0
    
    rjmp start
