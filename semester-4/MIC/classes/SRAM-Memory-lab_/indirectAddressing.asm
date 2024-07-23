
    .DSEG
    .ORG SRAM_START
    A: .BYTE 1
    B: .BYTE 1
    C: .BYTE 1

    .CSEG
    start:

	ldi XH, HIGH(A) 
	ldi XL, LOW(A)

	ld r0, X 
	
	ldi XH, HIGH(B)
	ldi XL, LOW(B)
	
	ld r1, X
	
	add r0, r1
	
  ldi XH, HIGH(C)
	ldi XL, LOW(C)
	
	st X, r0
	
	rjmp start