cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    jmp begin
    msg1 db 'Enter a 5 - letter word (UPPERCASE): $'
    msg2 db 10,13, 'Output in lowercase: $'

begin:
    ; clear screen
    mov ax, 0003h
    int 10h
 
    ; print 1st input message
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov cx, 5   ; loop counter
    mov bx, 0   ; prepare bx for DS offset storage of lowercase characters
 
;BLOCK A
x1:
    ; get character from user
    mov ah, 01
    int 21h

    add al, 20h     ; add 20h to ASCII value to convert to lowercase
    mov [bx], al    ; store lowercase character in DS offset
    inc bx          ; increment BX pointer
    loop x1
 
    ; print 2nd input message
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    mov bx, 4       ; prepare bx for retrieval of lowercase characters starting from the last character
    mov cx, 5       ; loop counter
 
;BLOCK B
x2:
    mov ah, 02
    mov dl, [bx]    ; retrieve lowercase ASCII value from DS offset
    int 21h         ; print
    dec bx          ; decrement BX pointer
    loop x2
 
    int 20h

cseg ends
end start