.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC

    MOV AH,2
    MOV BH,10
    MOV CX,26
    MOV BL,4
    MOV DL,97
    
imprime:
    INT 21h
    INC DL
    DEC BL
    JNZ saltar
    XCHG DL,BH
    INT 21h
    XCHG DL,BH
    MOV BL,4

saltar:
    LOOP imprime

    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN