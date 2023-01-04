! 8088 Generate Fibonacci 5
_EXIT = 1

.SECT .TEXT
start: ! Label at start (optional)

Initi:
	MOV     CX, 3
	MOV     SI, 0
	MOV     DI, 0
! Load first 2 fib no. 
    MOV     BX, b1
    MOVB    AL, (BX)(SI)
    MOV     BX, sequence
    MOVB    (BX)(DI), AL
    INC     DI
    MOV     BX, b2
    MOVB    AL, (BX)(SI)
    MOV     BX, sequence
    MOVB    (BX)(DI), AL
    INC     DI

fib:
    JCXZ    exit 
! Add b1 and b2 
    MOV     BX, b1
    MOVB    AL, (BX)(SI)
    MOV     BX, b2
    MOVB    DL, (BX)(SI)
    ADDB    DL, AL 
    MOV     BX, sequence
    MOVB    (BX) (DI), DL 
    MOVB    DH, 0
    PUSH    DX
! Updating b1
    MOV     BX, b2
    MOVB    AL, (BX)(SI)
    MOV     BX, b1
    MOVB    (BX)(SI), AL
! Updating b2
	POP 	AX
	MOV 	BX, b2
	MOVB 	(BX)(SI), AL

    INC     DI
    LOOP    fib
    
exit: ! Label at exit (optional)
PUSH _EXIT
SYS

.SECT .DATA
! Data declarations and initializations
b1:
    .BYTE 0
b2:
    .BYTE 1
sequence:
    .BYTE 0,0,0,0,0

.SECT .BSS

! Following .SECT .BSS an empty line