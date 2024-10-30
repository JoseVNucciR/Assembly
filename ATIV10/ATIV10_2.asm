TITLE PROGRAMA DE SOMA DE MATRIZES
.MODEL SMALL
.STACK 100h
Proximalinha macro
    PUSH AX
    PUSH DX 
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV AH,2
    MOV DL,13
    INT 21h
    POP AX 
    POP DX  
endm
.DATA
    MATRIZ4X4 DB 1,2,3,4
              DB 4,3,2,1
              DB 5,6,1,2
              DB 3,4,5,6
    MSG1 DB "A matriz é:$"
    MSG2 DB "A soma dos elementos é:$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    call ler
    call IMPRIME
    call soma
    MOV AH,4Ch 
    INT 21h
main endp

ler PROC 
    XOR BX,BX
poggers:
    XOR SI,SI
    MOV CX,4
linha:
    MOV AL,MATRIZ4X4[BX+SI]
    INT 21h
    INC SI
    LOOP linha
    Proximalinha
    ADD BX,4
    CMP BX,16
    JNE poggers
    RET
ler endp

IMPRIME PROC 
    XOR BX,BX
poggers1:
    XOR SI,SI
    MOV CX,4
    MOV AH,2
linha1:
    MOV AL,MATRIZ4X4[BX+SI]
    MOV DL,AL
    OR DL,30h
    INT 21h
    INC SI
    LOOP linha1
    Proximalinha
    ADD BX,4
    CMP BX,16
    JNE poggers1
    RET
IMPRIME ENDP

SOMA PROC  
    Proximalinha
    XOR BX,BX
poggers2:
    XOR SI,SI
    MOV CX,4
linha2:
    ADD AL,MATRIZ4X4[BX+SI]
    OR DL,30h
    INC SI
    LOOP linha2
    ADD BX,4
    CMP BX,16
    JNE poggers2
    
    
    MOV BX,10
    XOR CX,CX
poggers3:
    DIV BX   
    PUSH DX
    INC CX
    CMP AL,0
    JNE poggers3
    MOV AH,2
poggers4:
    POP DX
    OR DL,30h
    INT 21h
    LOOP poggers4
SOMA endp
END MAIN
    

