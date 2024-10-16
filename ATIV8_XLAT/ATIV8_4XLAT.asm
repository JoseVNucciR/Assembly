TITLE Saída de números hexadecimais
.MODEL SMALL
.STACK 100h
.DATA
    ARRAY db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,41h,42h,43h,44h,45h,46h  
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV BX,067BEh
    MOV CH,4
    MOV AH,2
    
POGGERS: 
    MOV DL,BH
    PUSH BX
    SHR DL,4
    LEA BX,ARRAY
    MOV AL,DL
    XLAT
    POP BX
    MOV DL,AL
    INT 21h
    ROL BX,4
    DEC CH
    JNZ POGGERS
    
    MOV AH,4CH
    INT 21h

MAIN ENDP 
END MAIN








MAIN ENDP
END MAIN