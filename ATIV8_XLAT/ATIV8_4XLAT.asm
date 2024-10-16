TITLE Saída de números hexadecimais de XISLAT
.MODEL SMALL
.STACK 100h
.DATA
    ARRAY db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,41h,42h,43h,44h,45h,46h  
.CODE
MAIN PROC
    ;permite acesso as variáveis de .DATA
    MOV AX,@DATA
    MOV DS,AX
    MOV BX,067BEh ;Define um valor em BX
    MOV CH,4 ;Adiciona o valor 4 ao contador CX
    MOV AH,2 ;Função de impressão do INT 21h
POGGERS: 
    MOV DL,BH ;salva os 8 bits de BH (67h) em DL
    PUSH BX ;empurra BX para o topo da pilha
    SHR DL,4 ;desloca o 7h para a direita para imprimir somente o 6h
    LEA BX,ARRAY ;entra no array e troca seu valor pelo seu respectivo caracter com o XLAT
    MOV AL,DL ;move DL para AL
    XLAT
    POP BX ;pega de volta o antigo valor de BX
    MOV DL,AL ;volta o valor de AL para DL para poder ser impresso
    INT 21h ;executa a função AX,2 de impressão
    ROL BX,4 ; rola os quatro primeiros bits (6h) para poder imprimir os próximos números hexa
    DEC CH  ;decrementa 1 de CH até todos os números serem impressos
    JNZ POGGERS
    MOV AH,4Ch ;finaliza o código
    INT 21h
MAIN ENDP 
END MAIN

