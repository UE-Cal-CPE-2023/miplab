cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clrscr

    mov ah, 09h
    lea dx, str1
    int 21h

    mov ah, 01h
    int 21h

    mov ah, 09h
    lea dx, str2
    int 21h

    mov var, al

    and var, 00000001b
    jnz odd

    mov ah, 09h
    lea dx, msg2
    int 21h
    jmp exit

odd:
    mov ah, 09h
    lea dx, msg1
    int 21h

exit:
    int 20h

; subroutines
; =======================
clrscr:
    mov ax, 0003h
    int 10h
    ret
; =======================

; data declaration
; =======================
str1 db 'Enter a digit: $'
str2 db 10,13,'The digit is $'
msg1 db 'ODD$'
msg2 db 'EVEN$'
var db ?
; =======================

cseg ends
end start