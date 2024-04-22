cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    call clrScreen

    ; print input message
    mov ah, 09h
    lea dx, lbl_input1
    int 21h

    ; get input buffer
    mov ah, 0Ah
    lea dx, input1
    int 21h

    ; print input message
    mov ah, 09h
    lea dx, lbl_input2
    int 21h

    ; get input buffer
    mov ah, 0Ah
    lea dx, input2
    int 21h

    ; load input buffer addresses
    lea si, input1.inp_array
    lea di, input2.inp_array
    cld

    mov al, input1.inp_len      ; load input1 string length
    cmp al, input2.inp_len      ; compare input string lengths
    je compare                  ; if equal, compare strings
    jmp not_match               ; else, strings do not match

compare:
    xor cx, cx                  ; clear cx register
    mov cl, input1.inp_len      ; load input1 (or input2) string length
    rep cmpsb                   ; compare strings byte by byte
    jne not_match               ; if char not equal, strings do not match

match:          
    ; print message and exit
    mov ah, 09h                 
    lea dx, lbl_match
    int 21h                     
    jmp exit

not_match:
    ; print message and exit
    mov ah, 09h
    lea dx, lbl_notmatch
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
    max_len db 32
    inp_len db ?
    inp_array db 32 dup ("$")
BufferInt21hFx0Ah ends
; =======================

; data declaration
; =======================
input1 BufferInt21hFx0Ah <32, ?, '$'>
input2 BufferInt21hFx0Ah <32, ?, '$'>
lbl_match db 10,13,'String matched$'
lbl_notmatch db 10,13,'String does not match$'
lbl_input1 db 10,13,'Enter 1st string: $'
lbl_input2 db 10,13,'Enter 2nd string: $'
; =======================

cseg ends
end start