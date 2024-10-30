TITLE PROGRAMA DE SOMA DE MATRIZES
.MODEL SMALL
.STACK 100h
Proximalinha macro ;pula linha sem alterar os valores de AX e DX
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
              DB 1,2,3,4
              DB 1,2,3,4
              DB 1,2,3,4
    MSG1 DB "Matriz: $"
    MSG2 DB "Soma dos elementos = $"
.CODE
MAIN PROC
    MOV AX,@DATA ;permite acesso as variáveis de .DATA
    MOV DS,AX
    call IMPRIME
    call soma
    MOV AH,4Ch ;finaliza o código
    INT 21h
main endp

IMPRIME PROC 
    MOV AH,9 ;imprime "MSG1"
    LEA DX,MSG1
    INT 21h
    Proximalinha ;pula linha
    XOR BX,BX ;zera o registrador para apontar para o primeiro valor da matriz
    XOR DX,DX
poggers1:
    XOR SI,SI ;zera o registrador para apontar para o primeiro valor da matriz
    MOV CX,4 ;define a quantidade de loops (de acordo com o tamanho da matriz)
    MOV AH,2
linha1:
    MOV DL,MATRIZ4X4[BX+SI] ;envia o valor correspondente da matriz para DL
    OR DL,30h ;transforma em número
    INT 21h ;imprime o valor
    INC SI ;incrementa SI, para mudar de coluna
    LOOP linha1 ;repete até imprimir todos da linha
    Proximalinha ;pula linha
    ADD BX,4 ;adiciona 4 a BX para quando imprimir todos os 16 eleentos da matriz finalizar o código
    CMP BX,16 ;enquanto não der 16 repete o código
    JNE poggers1
    RET ;retorna para o código principal
IMPRIME ENDP

SOMA PROC  
    Proximalinha
    XOR BX,BX ;zera o registrador para apontar para o primeiro valor da matriz
    XOR DX,DX ;zera o registrador 
poggers2:
    XOR SI,SI ;zera o registrador para apontar para o primeiro valor da matriz
    MOV CX,4 ;define a quantidade de loops (de acordo com o tamanho da matriz)
linha2:
    ADD DL,MATRIZ4X4[BX+SI] ;acidiona o valor correspondente em DL
    INC SI ;incrementa SI, para mudar de coluna
    LOOP linha2 ;repete até imprimir todos da linha
    ADD BX,4 ;adiciona 4 a BX para quando imprimir todos os 16 eleentos da matriz finalizar o código
    CMP BX,16 ;enquanto não der 16 repete o código
    JNE poggers2
    PUSH DX ;empilha o valor da soma
    MOV AH,9 ;imprime "MSG2"
    LEA DX,MSG2
    INT 21h
    POP DX ;recupera o valor anterior na pilha
    MOV AX,DX ;manda o valor para AX
    XOR DX,DX ;zera o registrador
    MOV BX,10 ;manda 10 para BX
    XOR CX,CX ;zera o contador
poggers3:
    DIV BX ;divide AX por BX
    PUSH DX ;guarda o resto na pilha 
    INC CX ; guarda quantas vezes carregou a pilha
    CMP AL,0 ;compara o resultado com 0, se não for igual continua dividindo
    JNE poggers3
    MOV AH,2 ;quando for igual chama a impressão
poggers4:
    POP DX ;puxa o valor guardado na pilha
    OR DL,30h ;transforma número
    INT 21h ;imprime o valor até sair tudo guardado da pilha
    LOOP poggers4
    RET ;retorna para o código principal
SOMA endp
END MAIN
    

