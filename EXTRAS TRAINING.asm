TITLE Exibindo o caracter *
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
repete:
MOV AH,1
INT 21h
MOV DL,AL
CMP DL,"0"
JNE imprime
MOV DL,'X'
imprime:
MOV AH,2
INT 21h
INC BL
CMP BL,4
JB repete
MOV AH,4Ch
INT 21h

MAIN ENDP
END MAIN
