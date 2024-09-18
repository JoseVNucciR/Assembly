 TITLE 
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Escreva um numero:$',10,13;
    MSG2 DB 10,13,'Soma dos 5 numeros = $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV CX,5

numero:
    MOV AH,9
    LEA DX, MSG1
    INT 21h

    MOV AH,1
    INT 21h

    SUB AL,30h

    ADD BL,AL

    MOV AH,2
    MOV DL,10
    INT 21h

    LOOP numero


    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ADD BL,30h

    MOV AH,2
    MOV DL,BL
    INT 21h

    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN






