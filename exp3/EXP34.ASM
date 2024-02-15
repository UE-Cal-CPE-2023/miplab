cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    start:
        jmp begin
        str1 db 'NCP 2205$'
    begin:
        mov ax, 003h
        int 10h

        mov ah, 02
        mov dh, 1
        mov dl, 37
        int 10h
        
        ;BLOCK A
        mov ah, 13h
        mov al, 0
        mov bl, 0C1h
        lea bp, str1
        mov cx, 6
        mov dh, 0
        mov dl, 38
        int 10h
	
        ;pause and wait for keyboard press
 	    mov ah, 01
        int 21h
       
        int 20h
        cseg ends
end start
