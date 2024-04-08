
    .DSEG
    .ORG SRAM_START
    A: .BYTE 1
    B: .BYTE 1
    C: .BYTE 1

    .CSEG
    start:

	ldi YH, HIGH(A) 
	ldi YL, LOW(A)

	ldd r0, Y+0
	ldd r1, Y+1
	
	add r0, r1
	st Y+2, r0
	
	rjmp start