cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    jmp begin
    name1 label byte 
    maxlen db 10
    actlen db ?
    datas db 10 dup ("$")
    msg1 db 'Enter a string maximum of 9 characters: $'
    msg2 db 10,13,'Numbers: $'
    count db '0'
begin:
    mov ax, 0003h
    int 10h

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0ah
    lea dx, name1
    int 21h

    lea si, datas
    cld

    mov ch,00
    mov cl, actlen

loop1: 
    lodsb
    cmp al, 30h
    jl here

    cmp al, 3Ah
    jl num 

    cmp al, 3Ah
    jge here

num: 
    inc count

here:
    loop loop1

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 02h
    mov dl, count
    int 21h

    int 20h

cseg ends
end start
