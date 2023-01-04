! 8088 Implement Tiple Nested Loop
_EXIT = 1

.SECT .TEXT
start: ! Label at start (optional)
! Instruction/Code Section

init1:
	MOV CX, 5
loop1:
	JCXZ exit
init2:
	PUSH CX
	MOV CX, 5
loop2:
	JCXZ continue
init3:
	PUSH CX
	MOV CX, 5
loop3:
	JCXZ continue2
	LOOP loop3
continue2:
	POP CX
	LOOP loop2
continue:
	POP CX
	LOOP loop1

exit: ! Label at exit (optional)
PUSH _EXIT
SYS

.SECT .DATA
! Data declarations and initializations


.SECT .BSS

! Following .SECT .BSS an empty line