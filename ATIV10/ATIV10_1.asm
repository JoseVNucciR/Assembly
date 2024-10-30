TITLE PROGRAMA PARA MANIPULAÇÃO DE MATRIZES
.MODEL SMALL
.STACK 100h
Proximalinha macro
;pula linha sem alterar os valores de AX e DX
    PUSH AX
    PUSH DX 
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV AH,2
    MOV DL,13
    INT 21h
    POP AX 
    POP DX  
endm
.DATA
    MATRIZ4X4 DB 1,2,3,4
              DB 4,3,2,1
              DB 5,6,7,8
              DB 8,7,6,5
.CODE
MAIN PROC
    ;permite acesso as variáveis de .DATA
    MOV AX,@DATA
    MOV DS,AX
    call imprime
    ;finaliza o código
    MOV AH,4Ch
    INT 21h
MAIN ENDP

IMPRIME PROC 
    ;zera o registrador para apontar para o primeiro valor da matriz
    XOR BX,BX
poggers:
    ;zera o registrador para apontar para o primeiro valor da matriz
    XOR SI,SI
    ;define a quantidade de loops (de acordo com o tamanho da matriz)
    MOV CX,4
    MOV AH,2
linha:
    ;envia o valor correspondente da matriz para DL
    MOV DL,MATRIZ4X4[BX+SI]
    ;transforma em número
    OR DL,30h
    ;imprime o valor
    INT 21h
    ;incrementa SI, para mudar de coluna
    INC SI
    ;repete até imprimir todos da linha
    LOOP linha
    ;macro para pular de linha
    Proximalinha
    ;adiciona 4 a BX para quando imprimir todos os 16 eleentos da matriz finalizar o código
    ADD BX,4
    CMP BX,16
    ;enquanto não der 16 repete o código
    JNE poggers
    ;retorna para o código principal
    RET
IMPRIME ENDP
END MAIN

