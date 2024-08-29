TITLE ATIV2_1
.MODEL SMALL
.DATA
    MSG1 DB 13,10,'Digite uma letra miuscula:$'
    MSG2 DB 13,10,'A letra maiuscula correspondente eh:$'
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

    ; Subtrai 20h de BL para transformar de minúsculo para maiúsculo
    SUB bl,20h

    ; Move o cursor para a linha seguinte
    MOV AH,2
    MOV DL,10
    INT 21h 

    ; Exibe a Mensagem 2 "MSG2" na tela
    MOV AH,9
    LEA DX,MSG2
    INT 21h 
    
    ; Exibe o caracter lido que estava salvo em BL
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Finaliza o programa
    MOV AH,4Ch 
    INT 21h

MAIN ENDP
END MAIN