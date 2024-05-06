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

    and al, 00001000b
    jz no

    mov ah, 09h
    lea dx, msg1
    int 21h
    jmp exit

no:
    mov ah, 09h
    lea dx, msg2
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
str1 db 'Enter a character: $'
str2 db 10,13,'Output: $'
msg1 db 'MSB is 1$'
msg2 db 'MSB is 0$'
var db ?
; =======================

cseg ends
end start