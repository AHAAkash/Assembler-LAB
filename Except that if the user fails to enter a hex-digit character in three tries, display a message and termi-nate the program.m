DATA segment
    msg1  db  'Enter a Hex Digit: $'
    msg2  db  0Ah,0dh,'In Decimal it is '
          db  '$'
    msg3  db  0AH,0dh, 'Do you want to do it again? $'
    error_msg db 0Ah,0dh,'Invalid input! Please enter a valid hex digit (0-9, A-F): $'
    exit_msg db 0Ah,0dh,'Too many invalid attempts! Program terminated. $' 
    count db 0  ; Define count variable
DATA ends

Code segment
    assume  cs:code, ds:code

start:
    mov ax, data
    mov ds, ax
    mov count, 0  ; Initialize error counter
    jmp WHILE

new_line:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov count, 0   ; Reset error counter if user wants to continue
    jmp WHILE

WHILE:    
    ; Display prompt
    mov ah, 9
    mov dx, offset msg1
    int 21h
    
    ; Read value
    mov ah, 1
    int 21h
    mov bl, al  ; Store input

    ; Check if digit (0-9)
    cmp al, '0'
    jb INVALID_INPUT
    cmp al, '9'
    jbe PRINT_DECIMAL

    ; Check if letter (A-F)
    cmp al, 'A'
    jb INVALID_INPUT
    cmp al, 'F'
    jbe letter

    ; Invalid input case
INVALID_INPUT:
    inc count  ; Increment invalid input counter
    cmp count, 3  ; Check if user has failed 3 times
    je TERMINATE  ; If failed 3 times, terminate program

    ; Show error message
    mov ah, 9
    mov dx, offset error_msg
    int 21h
    jmp WHILE  ; Ask again

PRINT_DECIMAL:
    mov ah, 9
    mov dx, offset msg2
    int 21h
    mov ah, 2
    mov dl, bl
    int 21h
    jmp prompt

letter:
    cmp al, 'A'
    je A
    cmp al, 'B'
    je B
    cmp al, 'C'
    je C
    cmp al, 'D'
    je D
    cmp al, 'E'
    je E    
    cmp al, 'F'
    je F

A:  
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '0'
    int 21h
    JMP prompt

B:
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '1'
    int 21h
    JMP prompt

C:  
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '2'
    int 21h
    JMP prompt

D:                                  
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '3'
    int 21h
    JMP prompt

E: 
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '4'
    int 21h
    JMP prompt

F:
    mov dx, offset msg2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, '1'
    int 21h
    mov dl, '5'
    int 21h
    JMP prompt     

prompt:
    mov ah, 9
    mov dx, offset msg3
    int 21h

    ; Read option
    mov ah, 1
    int 21h

    ; Compare
    cmp al, 'Y'  
    je new_line
    cmp al, 'y'
    je new_line

EXIT:
    mov ah, 4Ch
    int 21h

TERMINATE:
    mov ah, 9
    mov dx, offset exit_msg
    int 21h
    jmp EXIT  ; Exit the program

Code ends
    end start
