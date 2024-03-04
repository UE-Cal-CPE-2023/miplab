cseg segment para 'code'
assume cs:cseg, ds:cseg, es:cseg, ss:cseg
org 100h
    start:
        jmp begin
        char1 db 'A'
        char2 db 'a'
    begin:
        mov ax, 0003h
        int 10h
        
        ;BLOCK A
        mov cx, 5
        mov ah, 02h
        mov char2 , 'Z'
    x1:
        mov dl, char2
        int 21h
        mov dl, 10
        int 21h
        sub char2, 2
        loop x1
        
        int 20h
        cseg ends
end start