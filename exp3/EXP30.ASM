cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    start:
        jmp begin
        str1 db 'NCP 2205$'
    begin:
        mov ax, 003h
        int 10h           
        
        ;BLOCK A
        mov ah, 00
        mov al, 01
        int 10h
	
        ;pause and wait for keyboard press
 	    mov ah, 01
        int 21h
       
        int 20h
        cseg ends
end start
