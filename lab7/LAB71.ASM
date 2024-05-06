cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clrscr

    mov ah, 09h
    lea dx, str1
    int 21h

    mov ah, 0Ah
    lea dx, input_string
    int 21h

    lea si, datastr
    cld

    mov ch, 00
    mov cl, actlen

    mov ah, 09h
    lea dx, str2
    int 21h

lb1:
    lodsb
    mov var, al
    cmp var, 41h
    jae lb2
    jmp print

lb2:
    cmp var, 5Ah
    jbe convert
    jmp print

convert:
    xor var, 00100000B

print:
    mov ah, 02h
    mov dl, var
    int 21h

    loop lb1

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
input_string label byte
maxlen db 40
actlen db ?
datastr db 40 dup ("?")
str1 db 'Enter a string: $'
str2 db 10,13,'Output in lowercase: $'
var db ?
; =======================

cseg ends
end start