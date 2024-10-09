TITLE Entrada de números binários
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV CX,16
    MOV AH,1
    XOR BX,BX
    INT 21h
TOPO:
    CMP AL,0DH
    JE SEGUE
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    INT 21h
    LOOP TOPO
SEGUE:
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

    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN