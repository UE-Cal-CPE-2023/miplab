cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    JMP begin
    ;data declaration
    d1 db 'T',10,13,'$'
    d2 db ' I',10,13,'$'
    d3 db '  M',10,13,'$'
    d4 db '   O',10,13,'$'
    d5 db '    T',10,13,'$'
    d6 db '     H',10,13,'$'
    d7 db '      Y',10,13,'$'
begin:
    ;clear screen
    mov ax, 0003h
    int 10h
    
    ;T
    mov ah, 09
    lea dx, d1
    int 21h

    ;I
    mov ah, 09
    lea dx, d2
    int 21h

    ;M
    mov ah, 09
    lea dx, d3
    int 21h

    ;O
    mov ah, 09
    lea dx, d4
    int 21h

    ;T
    mov ah, 09
    lea dx, d5
    int 21h

    ;H
    mov ah, 09
    lea dx, d6
    int 21h

    ;Y
    mov ah, 09
    lea dx, d7
    int 21h

    ;exit
    int 20h
cseg ends
end start
