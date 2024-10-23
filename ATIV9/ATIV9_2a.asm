TITLE  PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO rSI ou rDI
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
    ;endereço do vetor é colocado em SI
    LEA SI, VETOR
VOLTA:
    ;move o valor atual do vetor para DL e incrementa SI para apontar para o próximo
    MOV DL, [SI]
    INC SI
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