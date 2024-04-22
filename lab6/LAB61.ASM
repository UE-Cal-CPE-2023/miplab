cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clrScreen

    ; print input message
    mov ah, 09h
    lea dx, lbl_input
    int 21h

    ; get input buffer
    mov ah, 0Ah
    lea dx, input_buffer
    int 21h

    ; load pointer to buffer
    lea si, input_buffer.inp_array
    cld

    ; clear cx and load input length
    xor cx, cx
    mov cl, input_buffer.inp_len

loop1: 
    lodsb               ; load string buffer
    cmp al, 21h         ; if char is less than '!',
    jl loop_char        ; then it is a control character

    cmp al, 41h         ; if char is less than 'A',
    jl check_not_ltr    ; then it is not a letter

    cmp al, 7Fh         ; if char is less than DEL,
    jl check_spc        ; then it is a letter or a special char

check_not_ltr:
    cmp al, 30h         ; if char is less than '0',
    jl is_spc           ; then it is a special char

    cmp al, 39h         ; if char is less than or eq '9',
    jle is_num          ; then it is a number

    jmp is_spc          ; else it is a special char

check_spc:
    cmp al, 5Ah         ; if char is less than or eq 'Z',
    jle is_ltr          ; then it is a letter

    cmp al, 61h         ; if char is less than 'a',
    jl is_spc           ; then it is a special char

    cmp al, 7Ah         ; if char is less than or eq 'z',
    jle is_ltr          ; then it is a letter

    jmp is_spc          ; else it is a special char

is_ltr:
    inc ltr_count
    jmp loop_char

is_num:
    inc num_count
    jmp loop_char

is_spc:
    inc spc_count
    jmp loop_char

loop_char:
    loop loop1

finish:
    ; print number count
    mov ah, 09h
    lea dx, lbl_outnum
    int 21h

    mov ah, 02h
    mov dl, num_count
    int 21h

    ; print letter count
    mov ah, 09h
    lea dx, lbl_outltr
    int 21h

    mov ah, 02h
    mov dl, ltr_count
    int 21h

    ; print special character count
    mov ah, 09h
    lea dx, lbl_outspc
    int 21h

    mov ah, 02h
    mov dl, spc_count
    int 21h

exit:
    int 20h

; subroutines
; =======================
clrScreen:
    mov ax, 0003h
    int 10h
    ret
; =======================

; struc declaration
; =======================
BufferInt21hFx0Ah struc
    max_len db 10
    inp_len db ?
    inp_array db 10 dup ("$")
BufferInt21hFx0Ah ends
; =======================

; data declaration
; =======================
input_buffer BufferInt21hFx0Ah <10, ?, '$'>
lbl_input db 'Enter a string (maximum of 9 characters): $'
lbl_outltr db 10,13,'Letters: $'
lbl_outnum db 10,13,'Numbers: $'
lbl_outspc db 10,13,'Special Characters: $'
ltr_count db '0'
num_count db '0'
spc_count db '0'
; =======================

cseg ends
end start