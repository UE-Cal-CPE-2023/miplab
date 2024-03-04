cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    start:
        jmp begin
        char1 db 'J'
        row db 5
        col db 5
    begin:
        mov ax, 0003h
        int 10h
        
        ;BLOCK A
        mov cx, 10
    x1:
        mov ah, 02h
	    mov dh, row
	    mov dl, col
	    int 10h

	    mov ah, 02
        mov dl, char1
        int 21h
                
        inc row
	    inc col
	    inc char1
        loop x1
	
        int 20h
        cseg ends
end start
