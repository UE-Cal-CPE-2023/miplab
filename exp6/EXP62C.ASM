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
        lea di, val3
        cld

        mov cx,8

        rep cmpsb
        jne not_match

    match:          
        mov ah, 09h
        lea dx, msg1
        int 21h
        jmp exit

    not_match:
        mov ah, 09h
        lea dx, msg2
        int 21h

    exit:    
        int 20h

cseg ends
end start
