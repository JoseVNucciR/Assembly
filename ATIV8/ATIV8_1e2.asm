TITLE Entrada de números binários
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV CX,16 ;carrega o contador com o valor de 16
    MOV AH,1 ;função de leitura
    XOR BX,BX ;zera o registrador BX
    INT 21h ;lê o caracter do teclado
TOPO:
    CMP AL,0DH ;compara com o caracter "enter", se for igual vai para "SEGUE"
    JE SEGUE
    AND AL,0FH ;transforma o caractere em número
    SHL BX,1 ;desloca 1 bit a esquerda de BX
    OR BL,AL ; executa or entre BL e AL
    INT 21h  ;lê o caractere do teclado
    LOOP TOPO ;decrementa CX e se não for zero repete TOPO
SEGUE:
    MOV CX,16 ;carrega o contador com o valor de 16
    MOV AH,2 ;função para exibir caractere
abra:
    ROL BX,1 ;rola 1 bit mais significativo para o fim (move para a esquerda), se não houver carry pula para bulbassaur
    JNC bulbasaur
    MOV DL,31h ;se houver carry carrega o valor ASCII "1"
    INT 21h ;exibe o caractere
    JMP charmander
bulbasaur:
    MOV DL,30h ;carrega o valor "0" do ASCII
    INT 21h ;exibe caractere "0" na tela
charmander:
    LOOP abra ;decrementa CX até ser 0
    MOV AH,4CH ;finaliza o programa
    INT 21h

    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN