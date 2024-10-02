TITLE While 
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV DL,'*' ; salva o caracter * em DL   
    MOV AH,1 ; função de ler o t caracter digitado no teclado
REPETE:
    INT 21h ; lê o caracter
    CMP AL,13 ; compara o conteúdo de AL com o CX
    JE FIM ; se igual pula para FIM
    INC CL ;  se diferente, adiciona 1 ao contador CX
    JMP REPETE ; repete a função 'REPETE'
FIM:
    MOV AH,2 ; função de imprimir 
    INT 21h ; imprime o caracter
    LOOP FIM ; vai imprimir '*' até decrementar totalmente o conteúdo de CX
    MOV AH,4Ch ;comando para finalizar o código
    INT 21h ; finaliza o código
MAIN ENDP
END MAIN