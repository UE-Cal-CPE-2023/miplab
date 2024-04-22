cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call cls

    ; print input message
    mov ah, 09h
    lea dx, inp_msg
    int 21h

    ; get input
    mov ah, 01h
    int 21h

    ; convert to uppercase
    sub al, 20h

    ; print output message
    mov ah, 09h
    lea dx, out_msg
    int 21h

    ; print uppercase letter
    mov dl, al
    mov ah, 02h
    int 21h

exit:
    int 20h

; subroutines
; =======================
cls:
    mov ax, 0003h
    int 10h
    ret
; =======================

; data declaration
; =======================
inp_msg db 'Enter a lowercase letter>> $'
out_msg db 10,13,'Uppercase letter>> $'
; =======================

cseg ends
end start