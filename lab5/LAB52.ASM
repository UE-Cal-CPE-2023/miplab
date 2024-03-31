cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen

    ; print input label
    mov ah, 09h
    lea dx, lbl1
    int 21h

    ; compute needed space to print the output = max_interval * 2
    xor ax, ax              ; clear ax
    mov al, max_interval    ; prep max_interval to be multiplied by 2
    xor dx, dx              ; clear dx
    mov dl, 2               ; load 2 to dl
    mul dl                  ; multiply al by 2

    ; store the needed screen space to max_x  
    mov max_x, al             

    ; read a character from the keyboard
    mov ah, 01h
    int 21h

    xor cx, cx              ; clear cx
    mov cl, max_interval    ; prep loop counter
    inc cl                  ; num of characters to be printed is max_interval + 1

lp1:
    ; move cursor
    mov ah, 02h
    mov dh, start_y
    mov dl, max_x           ; computed max_x
    int 10h

    ; print character
    sub al, current_interval    ; initial current_interval is 0
                                ; but will be decremented by 1 in the first iteration
    mov ah, 0Eh  
    int 10h

    ; set values for next iteration
    mov current_interval, cl  
    dec current_interval        ; store loop counter minus 1 in current_interval
                                ; this is basically the max_interval,
                                ; which defines the first decrement value
    sub max_x, 2              ; move cursor 2 spaces to the left

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
lbl1 db 'Enter a lowercase letter>> $'
start_y db 1
max_interval db 8
current_interval db 0
max_x db 0
; =======================

cseg ends
end start