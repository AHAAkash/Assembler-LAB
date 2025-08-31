.MODEL SMALL
.STACK 100H
.DATA
msg1 DB 0DH, 0AH, '$'  ; Carriage return and Line Feed for new line

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BL, 80H      ; Start ASCII from 80h
    MOV CX, 0        ; Clear CX for outer loop

print_loop:
    MOV CL, 0AH      ; Inner loop counter (10 characters per line)

print_char:
    MOV AH, 02H      ; DOS function to print character
    MOV DL, BL       ; Load ASCII character in DL
    INT 21H          ; Print character

    MOV DL, ' '      ; Print space
    INT 21H

    CMP BL, 0FFH     ; Check if we reached the last character
    JZ end           ; Exit if finished

    INC BL           ; Move to the next ASCII character
    DEC CL           ; Decrement character count

    JNZ print_char   ; Continue printing until 10 characters are printed

                     ; Print a newline
    MOV DX, OFFSET msg1
    MOV AH, 09H
    INT 21H

    JMP print_loop   ; Go for the next 10 characters

end:
    MOV AH, 4CH      ; DOS terminate program
    INT 21H

MAIN ENDP
END MAIN
