TITLE Exibindo o caracter *
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC

    MOV CL,50

comando1:
    MOV AH,2
    MOV DL,'*'
    INT 21h
    DEC CL
    CMP CL,0
    JG comando1
    MOV CL,50

comando2:
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV AH,2 
    MOV DL,'*'
    INT 21h
    DEC CL
    CMP CL,0
    JG comando2 

end:
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN


