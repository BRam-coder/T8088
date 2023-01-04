! 8088 Search for k
_EXIT = 1

.SECT .TEXT
start: ! Label at start (optional)
! Instruction/Code Section

initi: 
	MOV 	CX, 10
	MOV 	SI, 0
	MOV 	DI, 0
search: 
	JCXZ 	exit
	MOV 	BX, list
	MOVB 	AL, (BX)(SI)
	MOVB	DL, (k) 
	CMPB 	AL, DL
	JE 	    foundit
notit:    
	MOV 	BX, list
	MOVB 	(BX)(SI), 0
    JNZ 	nextnumber
foundit:
    JCXZ 	exit
    MOV     BX, found
    MOVB 	(BX)(DI), AL
    JZ 	    nextnumber
nextnumber:
    INC 	SI    
	LOOP 	search


exit: ! Label at exit (optional)
PUSH _EXIT
SYS
.SECT .DATA
! Data declarations and initializations
list:
    .BYTE 1,4,3,7,8,2,6,9,10,5
k:
    .BYTE 7
found:
    .BYTE 0

.SECT .BSS
! Following .SECT .BSS an empty line


