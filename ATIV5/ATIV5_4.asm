.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    ;código para exibição
    MOV AH,2
    ;código para nova linha
    MOV BH,10
    ;adiciona o valor de 26 em CX, usado como contador para exibir as letras 
    MOV CX,26
    ;BL será usado como contador, definindo 4 para a quebra de linha
    MOV BL,4
    ;exibir caracter "a", 97 na tabela ASCII
    MOV DL,97
    
imprime:
    ;exibe o caracter em DL, inicialmente 'a'
    INT 21h
    ;incrementa DL para passar para o próximo caracter da tabela ASCII
    INC DL
    ;decrementa o valor de BL que é usado para contar até 4
    DEC BL
    ;se o valor não for zero, pula para 'saltar' para continuar exibindo letras
    JNZ saltar
    ;se for zero, troca o valor de DL e BH e quebra de linha
    XCHG DL,BH
    INT 21h
    ;troca os valores de volta, restaurando o próximo caracter a ser exibido
    XCHG DL,BH
    ;volta BL a 4 para que o ciclo continue 
    MOV BL,4

saltar:
    ;decrementa o valor de CX, se diferente de 0, volta apara 'imprime' até exibir todas as letras minúsculas
    LOOP imprime
    ;interrompe o código para finalizá-lo
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN