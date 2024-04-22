cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    
    start:
        jmp begin
        val1 db 'NCP 2205$'
        val2 db ?
        val3 db 'NCP2205$'
        msg1 db 10,13,'Same string$'
        msg2 db 10,13,'Not same string$'
    begin:
        mov ax, 0003h
        int 10h
        
        lea si, val1
        lea di, val2
        cld

        mov cx, 8
  
    xx:
       ;BLOCK A
       movsb
       loop xx
        
    mov ah, 09h
    lea dx, val2
    int 21h
    
    int 20h
cseg ends
end start
