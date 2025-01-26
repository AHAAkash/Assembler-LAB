
TITLE PGM4 2: PRINT STRING PROGRAM 
.MODEL SMALL 
.STACK 100H  
.DATA
MSG DB 'HELLO!$'
.CODE 
MAIN PROC   
    
    ;initialize DS 
    MOV AX, @DATA 
    MOV DS, AX     ;initialize DS
    
    ;display message 
    LEA DX, MSG    ;get message
    MOV AH, 9      ;display string function
    INT 21h        ;display message
    
    ;return to DOS 
    MOV AH, 4CH 
    INT 21h        ;DOS exit
   
MAIN ENDP
END MAIN
       


