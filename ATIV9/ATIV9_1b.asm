TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO registradorBX
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
    ;insere o valor 6 ao contador CX (7=elementos do vetor)
    MOV CX,7
    ;zera o registrador BX
    XOR BX, BX
VOLTA:
    ;move o valor do vetor que a posição BX aponta para DL e incremente BX para apontar para o próximo elemento
    MOV DL, VETOR[BX]
    INC BX
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
