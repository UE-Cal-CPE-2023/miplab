cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen

    ; print input label
    mov ah, 09
    lea dx, lbl1
    int 21h

    ; get input
    mov ah, 01
    int 21h
    
    ; convert input to ASCII uppercase
    sub al, 20h

    ; clear AH and store to stack
    xor ah, ah
    push ax

    ; print output label
    mov ah, 09
    lea dx, lbl2
    int 21h

    ; clear DH, pop stack to DX and print
    xor dh, dh
    pop dx
    mov ah, 02
    int 21h

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
lbl2 db 10,13,'Uppercase equivalent>> $'
; =======================

cseg ends
end start