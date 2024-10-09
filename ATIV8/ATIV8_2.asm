TITLE Saída de números binários
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV BX,1
    MOV CX,16
    MOV AH,2
abra:
    ROL BX,1
    JNC bulbasaur
    MOV DL,31h
    INT 21h
    JMP charmander
bulbasaur:
    MOV DL,30h
    INT 21h
charmander:
    LOOP abra
    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN