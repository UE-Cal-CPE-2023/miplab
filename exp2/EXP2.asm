cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    JMP begin
    ;data declaration
    val1 db 'NCP$'
    val2 db '2205',10,13,'$'
    val3 db 10,13,'#$'
begin:
    ;clear screen
    mov ax, 0003h
    int 10h
    
    ;BLOCK A
    mov ah, 02
    mov dl, val1
    int 21h

    ;BLOCK B
    mov ah, 09
    lea dx, val2
    int 21h

    ;BLOCK C
    lea dx, val3
    int 21h

    ;exit
    int 20h
cseg ends
end start
