cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    JMP begin
    ;data declaration
    d1 db 'E',10,13,'$'
    d2 db ' U',10,13,'$'
    d3 db '  N',10,13,'$'
    d4 db '   A',10,13,'$'
begin:
    ;clear screen
    mov ax, 0003h
    int 10h
    
    ;E
    mov ah, 09
    lea dx, d1
    int 21h

    ;U
    mov ah, 09
    lea dx, d2
    int 21h

    ;N
    mov ah, 09
    lea dx, d3
    int 21h

    ;A
    mov ah, 09
    lea dx, d4
    int 21h

    ;exit
    int 20h
cseg ends
end start
