TITLE ATIV2_2
.MODEL SMALL
.DATA
    MSG1 DB 13,10,'Digite um primeiro numero:$'
    MSG2 DB 13,10,'Digite um segundo numero:$'
    MSG3 DB 13,10,'A soma dos dois numeros eh:$'
.CODE
 MAIN PROC
    ; Permite o acesso às variáveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX

    ; Exibe a Mensagem 1 "MSG1" na tela
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    ; Lê um caracter escrito e salva ele em AL
    MOV AH,1
    INT 21h

    ; Move o caracter de AL para BL
    MOV bl,al 

    ; Subtrai 30h de BL 
    SUB bl,30h

    ; Move o cursor para a linha seguinte
    MOV AH,2
    MOV DL,10
    INT 21h 

    ; Exibe a Mensagem 2 "MSG2" na tela
    MOV AH,9
    LEA DX,MSG2
    INT 21h 

    ; Lê um caracter escrito e salva ele em AL
    MOV AH,1
    INT 21h

    ;Subtrai 30h de AL
    SUB AL,30h

    ;Passa o valor de AL para CL
    MOV CL,AL

    ; Move o cursor para a linha seguinte
    MOV AH,2
    MOV DL,10
    INT 21h 

    ; Exibe a Mensagem 3 "MSG3" na tela
    MOV AH,9
    LEA DX,MSG3
    INT 21h 

    ; Soma os valores de CL com BL
    ADD BL,CL

    ;Adiciona 30h em BL
    ADD BL,30h

    ; Exibe o caracter lido que estava salvo em BL
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Finaliza o programa
    MOV AH,4Ch 
    INT 21h

MAIN ENDP
END MAIN