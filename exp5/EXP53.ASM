cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h

start:
    ; clear screen
    mov ax, 0003h
    int 10h

top:
    mov ah, 06      ; read character function / save to AL
    mov dl, 0FFh    ; return without waiting for key press
                    ; if no key pressed, zero flag is set
    int 21h

    jz entered      ; if no key pressed, jump to entered
    mov cl, al      ; save character in CL
    cmp al, 41h     ; compare character to 'A'
                    ; if character is 'A', set zero flag
                    ; if not 'A', zero flag remains unset/reset
    je exit         ; if zero flag is set, exit program

entered:
    mov ah, 02      ; write character function
    mov dl, cl      ; put last character in DL
                    ; if no last char, DL will be whitespace
    int 21h
    jmp top         ; repeat

exit:
    int 20h

cseg ends
end start