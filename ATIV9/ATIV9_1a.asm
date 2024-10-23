TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO registradorBX
.MODEL SMALL
.STACK 100h
.DATA
    VETOR DB 1,1,1,2,2,2
.CODE
MAIN PROC
    ;permite acesso às variáveis de .DATA
    MOV AX,@DATA 
    MOV DS,AX
    ;zera o registrador DL
    XOR DL,DL
    ;insere o valor 6 ao contador CX (6=elementos do vetor)
    MOV CX,6
    ;endereço do vetor é colocado em BX
    LEA BX,VETOR
VOLTA:
    ;move o valor atual do vetor para DL e incrementa BX para apontar para o próximo
    MOV DL,[BX]
    INC BX
    ;converte o número para o caracter ACII
    ADD DL,30h
    ;exibe o caracter guardado em DL
    MOV AH,02
    INT 21h
    ;decrementa CX até zerar ele quando exiber todos os elementos do vetor
    LOOP VOLTA
    ;finaliza o programa
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN