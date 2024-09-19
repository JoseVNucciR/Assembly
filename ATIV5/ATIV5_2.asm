TITLE Exibindo o caracter *
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC

    ;carrega CL (contador) com o valor de 50
    MOV CL,50

comando1:
    ;exibe o caracter '*' carregado em DL
    MOV AH,2
    MOV DL,'*'
    INT 21h
    ;decrementa CL até chegar em 0, se diferente retorna ao 'comando1'
    LOOP comando1
    ;volta o contador para 50 para poder exibir mais 50 asteriscos
    MOV CL,50

comando2:
    ;exibe a quebra de linha
    MOV AH,2
    MOV DL,10
    INT 21h
    ;exibe o caracter '*' carregado em DL
    MOV AH,2 
    MOV DL,'*'
    INT 21h
    ;decrementa CL até chegar em 0, se diferente retorna ao 'comando1'
    LOOP comando2

end:
    ;interrompe o código para finalizá-lo
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN