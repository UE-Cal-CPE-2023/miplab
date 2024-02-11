cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
start:
    JMP begin
    ;data declaration
    d1 db 'University of the East',10,13,'$'
    d2 db 'College of Engineering',10,13,'$'
    d3 db 'Computer Engineering Department',10,13,'$'
begin:
    ;clear screen
    mov ax, 0003h
    int 10h
    
    ;UE
    mov ah, 09
    lea dx, d1
    int 21h

    ;CEngg
    mov ah, 09
    lea dx, d2
    int 21h

    ;CPE
    mov ah, 09
    lea dx, d3
    int 21h

    ;exit
    int 20h
cseg ends
end start
