TITLE Exibindo o caracter *
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    ;exibir caracter "A", 65 na tabela ASCII
    MOV AH,2
    MOV DL,65
    ;adiciona o valor de 26 em CX, usado como contador para exibir as letras maíusculas
    MOV CX,26

maiúsculas:
    ;exibe o caracter inicialmente 'A'
    INT 21h
    ;incrementa o valor de DL passando para a próxima letra maíuscula na tabela ASCII
    INC DL
    ;decrementa o valor de CX, se diferente de 0, volta apara 'maiúsculas' até exibir todas as letras maíusculas
    LOOP maiúsculas

    ;exibe a quebra de linha
    MOV AH,2
    MOV DL,10
    INT 21h

    ;exibir caracter "a", 97 na tabela ASCII
    MOV AH,2
    MOV DL,97
    ;adiciona o valor de 26 em CX, usado como contador para exibir as letras minúsculas
    MOV CX,26

minúsculas:
    ;exibe o caracter inicialmente 'a'
    INT 21h
    ;;incrementa o valor de DL passando para a próxima letra maíuscula na tabela ASCII
    INC DL
    ;decrementa o valor de CX, se diferente de 0, volta apara 'minúsculas' até exibir todas as letras minúsculas
    LOOP minúsculas

end:
    ;interrompe o código para finalizá-lo
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN