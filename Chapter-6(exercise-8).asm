.model small
.stack 100h
.data
msg1 db "Enter Two Capital Letters: $"
msg2 db 10,13,"Please Enter Capital Letters: $"
msg3 db 10,13,"In Alphabetical Order: $"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display "?"
    mov dl,'?'
    mov ah,2
    int 21h 
    
    ; Printing First Message  
    lea dx, msg1
    mov ah, 9
    int 21h
    
    ; Getting the Input
    return: 
    mov ah, 1 
    int 21h    ; First input
    mov bl, al 
    int 21h    ; Second input
    mov bh, al 
    
    ; Compare two inputs
    cmp bl, bh
    jge level1
    
    cmp bh, bl
    jge level2
    
level1:
    lea dx, msg3
    mov ah, 9
    int 21h
    
    mov ah, 2   ; Printing in Alphabetical Order
    mov dl, bh
    int 21h
    mov dl, bl
    int 21h 
    
    jmp exit  ; Jump to exit
    
level2:  
    lea dx, msg3
    mov ah, 9
    int 21h
    
    mov ah, 2   ; Printing in Alphabetical Order
    mov dl, bl
    int 21h
    mov dl, bh
    int 21h 

exit:
    mov ah, 4Ch  ; DOS interrupt to exit
    int 21h 

main endp
end main
