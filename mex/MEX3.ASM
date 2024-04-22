cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call cls

    ; print input label
    mov ah, 09h
    lea dx, inp_msg
    int 21h

    ; read a character from the keyboard
    mov ah, 01h
    int 21h

    ; check if the character is an uppercase letter
    cmp al, 'A'
    jl start
    cmp al, 'Z'
    jg start

    ; store the character in the variable input_char
    mov input_char, al

    mov dh, 1           ; ensure cursor is at the second row
    push dx             ; save cursor position

main_lp:
    ; move cursor
    pop dx              ; restore cursor position
    mov ah, 02h
    mov dl, start_x     ; always start from the leftmost
    int 10h

    ; print
    mov ah, 09h
    mov al, char        ; print the character, always start from 'Z'
    mov bl, 07h         ; black background, white foreground
    mov cl, char_rept   ; print the character as many as char_rept, always start from 1
    int 10h

    ; set values for the next iteration
    inc dh                  ; move to the next row          
    inc char_rept           ; increase the number of character to print
    dec char                ; move back one alphabet
    push dx                 ; save cursor position
    mov dl, input_char    
    dec dl                  ; get the input character and compare to one less
    cmp char, dl            ; compare the current character with the input character minus 1
    jne main_lp                 ; if not equal, repeat the loop
    je exit                 ; if equal, exit

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
inp_msg db 'Enter an uppercase letter>> $'
start_x db 0
char db 'Z'
input_char db 0
char_rept db 1
; =======================

cseg ends
end start