cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h

start:
    jmp begin
    c1 db 'A'
    r db 1
    c db 2		

begin:
    mov ax, 0003h
    int 10h
    mov cx, 1

x1: 
    mov bx,cx
    mov c,2

x2:	
    mov ah, 02
    mov dh, r
    mov dl, c
    int 10h

    mov ah, 02
    mov dl, c1
    int 21h

    dec bx
    jz ext
    add c,2
    inc c1
    jmp x2

ext: 
    inc cx
    inc c1
    add r,2
    cmp cx, 6
    jne x1

    int 20h

cseg ends
end start
