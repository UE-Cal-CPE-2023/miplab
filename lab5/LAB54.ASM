cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clr_screen

    ; print input label
    mov ah, 09h
    lea dx, lbl_in
    int 21h

    ; get input
    mov ah, 01h
    int 21h
    mov input_char, al

    ; start checking if input is a consonant
    xor cx, cx              ; clear cx register
    mov cl, consonant_len   ; set loop counter to consonant array length
    xor si, si              ; set index to start of consonant array

check_consonant:
    mov al, consonant[si]   ; get nth character from consonant array
    cmp al, input_char      ; compare nth character with input character
    je consonant_found      ; if equal, jump to consonant_found
    inc si                  ; else, next character
    loop check_consonant

    ; once done with check_consonant, check if input is a vowel
    xor cx, cx              ; clear cx register
    mov cl, vowel_len       ; set loop counter to vowel array length
    xor si, si              ; reset index

check_vowel:
    mov al, vowel[si]       ; get nth character from vowel array
    cmp al, input_char      ; compare nth character with input character
    je vowel_found          ; if equal, jump to vowel_found
    inc si                  ; else, next character
    loop check_vowel

    ; if not a vowel or consonant
    jmp neither

consonant_found:
    ; print new line
    mov ah, 02h
    mov dl, crlf
    int 21h
    ; print message
    mov ah, 09h
    lea dx, lbl_c
    int 21h
    jmp exit

vowel_found:
    ; print new line
    mov ah, 02h
    mov dl, crlf
    int 21h
    ; print message
    mov ah, 09h
    lea dx, lbl_v
    int 21h
    jmp exit

neither:
    ; print new line
    mov ah, 02h
    mov dl, crlf
    int 21h
    ; print message
    mov ah, 09h
    lea dx, lbl_n
    int 21h
    jmp exit

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
lbl_in db 'Enter any letter>> $'
lbl_v db 'The letter is a vowel.$'
lbl_c db 'The letter is a consonant.$'
lbl_n db 'Invalid input, make sure it is part of the Roman alphabet!$'
consonant_len db 41
consonant db 'BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz'
vowel_len db 9
vowel db 'AEIOUaeiou'
input_char db 0
crlf db 0Ah, 0Dh, '$'
; =======================

cseg ends
end start