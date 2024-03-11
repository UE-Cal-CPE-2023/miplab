cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen
    mov cx, loop_count
    mov dh, y_start
    mov dl, x_start

lp1:
    ; position cursor
    mov ah, 02h
    mov bh, 0
    int 10h

    mov al, char1
    call print_char

    mov al, char2
    call print_char

    inc char1  
    dec char2
    add dh, y_inc

    loop lp1

exit:
    int 20h

; subroutines
; =======================
clr_screen:
    mov ax, 0003h
    int 10h
    ret

print_char:
    mov ah, 0Eh     
    int 10h         ; print character with teletype function (0Eh)
    mov ah, 02h
    mov bh, 0
    inc dl
    int 10h         ; move cursor forward
    ret

; =======================

; data declaration
; =======================
char1 db 'A'
char2 db 'z'
loop_count dw 7
x_start db 0
y_start db 0
y_inc db 1
; =======================

cseg ends
end start