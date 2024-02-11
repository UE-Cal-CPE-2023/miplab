cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    JMP begin
    ;data declaration
    d1 db 'AGUILAR',10,13,'$'
begin:
    ;clear screen
    mov ax, 0003h
    int 10h
    
    ;LAST NAME
    mov ah, 09
    lea dx, d1
    int 21h

    ;exit
    int 20h
cseg ends
end start
