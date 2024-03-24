cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h

start:
    jmp begin
    str1 db 'ZGE 4304$'
    msg1 db 'Character is present$'
    msg2 db 'Character is missing$'

begin:
    ; clear screen
    mov ax, 0003h
    int 10h
    
    lea bx, str1    ; load address of string into BX, pointer
    mov cx, 10      ; as long as CX is not zero, loop x repeats

x:
    mov dl, [bx]    ; load character into DL
    inc bx          ; adjust pointer to next character
    cmp dl, 32h     ; if character is '2', reset zero flag/skip loop
                    ; if not, set zero flag/loop x again
    loopne x
    jnz xx          ; if loop runs out and there is no '2', jump to xx
    
    ; tell user that '2' is in str1
    mov ah, 09h
    lea dx, msg1
    int 21h
    jmp exit

xx:
    ; tell user that '2' is not in str1
    mov ah, 09h
    lea dx, msg2
    int 21h

exit:
    int 20h

cseg ends
end start
