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
    x1:
        mov ah, 02h
        mov dl, char1
        int 21h
        mov dl, char2
        int 21h
        
        inc char1
        inc char2
        loop x1
        
        int 20h
        cseg ends
end start