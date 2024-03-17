cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h

start:
    jmp begin
    str1 db 'NCP 2205$'
    msg1 db 'Character is present$'
    msg2 db 'Character is missing$'

begin:
    ; clear screen
    mov ax, 0003h
    int 10h
    
    lea bx, str1
    mov cx, 10

x:
    mov dl, [bx]
    inc bx
    cmp dl, 32h
    loopne x
    jnz xx
    
    mov ah, 09h
    lea dx, msg1
    int 21h
    jmp exit

xx:
    mov ah, 09h
    lea dx, msg2
    int 21h

exit:
    int 20h

cseg ends
end start
