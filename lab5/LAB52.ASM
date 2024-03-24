cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen

    ; print input label
    mov ah, 09h
    lea dx, lbl1
    int 21h

    ; get input
    mov ah, 01h
    int 21h

    ; clear AH and store to stack
    xor ah, ah
    push ax


    mov cx, 1
    mov bx, 0

    mov ah, 01
    int 21h

x1:
    mov [bx], al
    sub al, count
    dec count
    inc bx
    cmp bx, 10
    jne x1

    mov bx, 8
    mov cx, 9
    mov ah, 09h
    lea dx, str2
    int 21h

x2:
    mov ah, 02
    mov dl, [bx]
    int 21h
    mov ah, 02
    mov dh, 1
    mov dl, col
    int 10h
    add col, 2
    dec bx
    loop x2

exit:
    int 20h

; subroutines
; =======================
clr_screen:
    mov ax, 0003h
    int 10h
    ret
; =======================

; data declaration
; =======================
lbl1 db 'Enter a lowercase letter>> $'
charp db 'A'
skip db 1
str2 db 10,13,'$'
col db 2
count db 8
; =======================

cseg ends
end start