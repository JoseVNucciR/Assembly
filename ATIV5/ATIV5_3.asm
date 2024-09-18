TITLE Exibindo o caracter *
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC

    MOV AH,2
    MOV DL,65
    MOV CX,26

maiúsculas:
    INT 21h
    INC DL
    LOOP maiúsculas

    MOV AH,2
    MOV DL,10
    INT 21h

    MOV AH,2
    MOV DL,97
    MOV CX,26

minúsculas:
    INT 21h
    INC DL
    LOOP minúsculas

end:
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN