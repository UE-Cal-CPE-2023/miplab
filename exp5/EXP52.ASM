cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    jmp begin
    msg1 db 'Enter a 5 - letter word (UPPERCASE): $'
    msg2 db 10,13, 'Output in lowercase: $'

begin:
    mov ax, 0003h
    int 10h
 
    mov ah, 09h
    lea dx, msg1
    int 21h
 
    mov cx, 5   ; loop to get 5 characters
    mov bx, 0   ; prepare bx for DS offset storage of lowercase characters (but bx is useless here)
 
;BLOCK A
x1:
    mov ah, 01
    int 21h

    add al, 32  ; add 32 to ASCII value to convert uppercase to lowercase
                ; take note that AH is still populated here, best practice is
                ; to clear AH before using AX for other purposes
    push ax     ; store the lowercase character in the stack
    loop x1

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov bx, 4   ; again, bx is useless here
    mov cx, 5   ; loop to print 5 characters

;BLOCK B
x2:
    ; get the top character from the stack for printing
    mov ah, 02
    pop dx
    int 21h
    loop x2

    int 20h

cseg ends
end start