TITLE PROGRAMA DE INVERSÃO DE VETORES
.MODEL SMALL
.DATA
    VETOR DB 1, 2, 3, 4, 5, 6, 7
.CODE
MAIN PROC
    ;permite acesso às variáveis de .DATA
               MOV  AX, @DATA
               MOV  DS,AX
    ;define SI como posição 6 do vetor
               MOV  SI,6
    ;zera o registrador BX (posição inicial do vetor)
               XOR  BX,BX
               CALL ler
               CALL inverter
               CALL imprimir
    ;finaliza o programa
               MOV  AH,4CH
               INT  21H
MAIN ENDP

ler PROC
    ;para ler os 7 elementos
               MOV  CX,7
    lendo:     
    ;guarda o primeiro valor do vetor em AL e incrementa BX para ir para o próximo elemento do vetor
               MOV  AL, VETOR[BX]
               INC  BX
    ;refaz lendo até zerar CX
               LOOP lendo
               RET
    
ler ENDP

inverter PROC
    ;atribui 3 ao contador cx, para executar a função 3 vezes
               MOV  CX,3
    ;zera o registrador BX
               XOR  BX,BX
    invertendo:
    ;guarda o primeiro valor do vetor em AL
               MOV  AL, VETOR[BX]
    ;troca o primeiro valor do vetor pelo último e o último vai para o lugar do primeiro
               XCHG AL, VETOR[SI]
               MOV  VETOR[BX], AL
    ;incrementa BX e decrementa SI para seguir para os próximos elementos do vetor
               INC  BX
               DEC  SI
    ;refaz invertendo até zerar o CX
               LOOP invertendo
               RET
inverter ENDP

imprimir PROC
    ;adiciona 7 ao contador CX para imprimir todos os elementos
               MOV  CX,7
    ;zera BX para apontar pro primeiro elemento do vetor
               XOR  BX,BX
    imprime:   
    ;move o valor do vetor que a posição BX aponta para DL e incremente BX para apontar para o próximo elemento
               MOV  DL, VETOR[BX]
               INC  BX
    ;converte o número para o caracter ACII
               OR   DL, 30H
    ;exibe o caracter guardado em DL
               MOV  AH, 02
               INT  21H
    ;decrementa CX até zerar ele quando exiber todos os elementos do vetor
               LOOP imprime
               RET
imprimir ENDP

END MAIN 