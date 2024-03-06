cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen
    mov cx, loop_count
    mov dh, y_start
    mov dl, x_start
    mov al, start_char

lp1:
    ; position cursor
    mov ah, 02h
    mov bh, 0
    int 10h

    ; print character with teletype function (0Eh)
    mov ah, 0Eh
    int 10h

    inc dh  ; increment y position
    inc dl  ; increment x position
    inc al  ; next letter

    loop lp1

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
start_char db 'A'
loop_count dw 10
x_start db 1
y_start db 1
x_inc db 1
y_inc db 1
; =======================

cseg ends
end start