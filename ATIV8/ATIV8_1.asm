TITLE Entrada de números binários
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV CX,16
    MOV AH,1
    XOR BX,BX
    INT 21h
;while
TOPO:
    CMP AL,0DH
    JE FIM
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    INT 21h
    LOOP TOPO
;end_while
FIM:
    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN
    