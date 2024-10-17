TITLE Entrada de números hexadecimais
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    XOR BX,BX ;zera o registrador BX
    MOV CL,4 ;atribui o valor 4 ao contador CL
    MOV AH,1 ;lê um caracter do teclado
    INT 21H
TOPO:
    CMP AL,0DH ;compara com o caracter "enter", se for igual vai para "FIM"
    JE FIM
    CMP AL,39H ;compara o número com "9", se for maior pula para "LETRA"
    JG LETRA 
    AND AL,0FH ;transforma o caractere em número 
    JMP DESLOCA
LETRA:
    SUB AL,37H ;transforma o caractere em letra
DESLOCA:
    SHL BX,CL ;desloca BX quatro bits para a esquerda
    OR BL,AL ;faz um or entre BL e AL
    INT 21H ;lê outro caractere digitado do teclado
    JMP TOPO ;salta novamente para TOPO para repetir o processo e pegar outro caractere
FIM:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN