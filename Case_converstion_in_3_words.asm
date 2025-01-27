
.MODEL SMALL
.STACK 100H
.DATA
CR EQU 0DH
LF EQU 0AH

MSG1 DB 'Enter three letters (Capital, Small, Capital): $'
MSG2 DB CR, LF, 'Converted format (Small, Capital, Small): $'
CHAR1 DB ?
CHAR2 DB ?
CHAR3 DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print user prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Input first character (Capital)
    MOV AH, 1
    INT 21H
    MOV CHAR1, AL
    ADD CHAR1, 20H ; Convert to small

    ; Input second character (Small)
    MOV AH, 1
    INT 21H
    MOV CHAR2, AL
    SUB CHAR2, 20H ; Convert to capital

    ; Input third character (Capital)
    MOV AH, 1
    INT 21H
    MOV CHAR3, AL
    ADD CHAR3, 20H ; Convert to small

    ; Print converted message
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Print CHAR1
    MOV DL, CHAR1
    MOV AH, 2
    INT 21H

    ; Print CHAR2
    MOV DL, CHAR2
    MOV AH, 2
    INT 21H

    ; Print CHAR3
    MOV DL, CHAR3
    MOV AH, 2
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN




