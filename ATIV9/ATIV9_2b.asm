TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO rSI ou rDI
.MODEL SMALL
.DATA
    VETOR DB 1, 1, 1, 2, 2, 2
.CODE
MAIN PROC
    ;permite acesso às variáveis de .DATA
    MOV AX, @DATA
    MOV DS,AX
    ;zera o registrador DL
    XOR DL, DL
    ;insere o valor 6 ao contador CX (6=elementos do vetor)
    MOV CX,6
    ;zera o registrador DI
    XOR DI, DI
VOLTA:
;move o valor do vetor que a posição DI aponta para DL e incrementa DI para apontar para o próximo elemento
    MOV DL, VETOR[DI]
    INC DI
    ;converte o número para o caracter ACII
    ADD DL, 30H
    ;exibe o caracter guardado em DL
    MOV AH, 02
    INT 21H
    ;decrementa CX até zerar ele quando exiber todos os elementos do vetor
    LOOP VOLTA
    ;finaliza o programa
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
