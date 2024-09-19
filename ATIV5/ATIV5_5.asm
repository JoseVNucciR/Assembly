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
    
    ;valor 5, ao contador CX
    MOV CX,5

numero:
    ;exibe a mensagem da primeira string
    MOV AH,9
    LEA DX, MSG1
    INT 21h

    ;lê o caracter digitado no teclado e armazena-o em AL
    MOV AH,1
    INT 21h

    ;subtrai 30h de AL convertendo o caractere ASCII para seu valor numérico
    SUB AL,30h

    ;adiciona o valor de AL em BL para guardá-lo
    ADD BL,AL

    ;exibe quebra de linha após o número ser digitado
    MOV AH,2
    MOV DL,10
    INT 21h

    ;decrementa o valor de CX, se não for zero repete 'numero'
    LOOP numero

    ;exibe a mensagem da segunda string
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ;converte o valor numerico de BL de volta para seu valor ACII para ser exibido como caractere
    ADD BL,30h

    ;exibe o caracter da soma total guardado em BL
    MOV AH,2
    MOV DL,BL
    INT 21h
    
    ;interrompe o código para finalizá-lo
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN






