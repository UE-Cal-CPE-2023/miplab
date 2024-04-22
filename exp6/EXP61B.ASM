cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
 jmp begin
    name_parameter label byte
    max_len db 20
    act_len db ?
    datas db 20 dup (?)
    msg1 db 'Input: $'
    msg2 db 'Output: $'
begin:
 mov ax, 0003h
 int 10h
 
 mov ah, 09h
 lea dx, msg1
 int 21h 
 
 mov ah, 0Ah
 lea dx, name_parameter
 int 21h
 
 lea bx, datas
 
 mov ah, 09h
 lea dx, msg2
 int 21h 
 
 mov ch, 00h
 mov cl, act_len
loop1:
 mov ah, 02
 mov dl, [bx]
 int 21h
 inc bx
 loop loop1
 
 int 20h
cseg ends
end start