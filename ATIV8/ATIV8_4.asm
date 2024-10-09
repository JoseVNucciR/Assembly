TITLE Saída de números hexadecimais
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
    MOV CH,4
    MOV CL,4
    MOV AH,2
TOPO: 
    MOV DL,BH
    SHR DL,CL
    CMP DL,0AH
    JAE LETRA   
    ADD DL,30h
    JMP depois
LETRA: 
    ADD DL,37H
depois:
    INT 21H
    ROL BX,CL
    DEC CH
    JNZ TOPO
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
