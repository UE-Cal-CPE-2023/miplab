cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h
start: 
    jmp begin
    var db 1
    msg1 db 'EVEN$'
    msg2 db 'ODD$'
begin:
    mov ax, 0003h
    int 10h    
    
    and var, 00000010B

    jz ev
    
    mov ah, 09h
    lea dx, msg2
    int 21h
    loop exit

ev:
    mov ah, 09h
    lea dx, msg1
    int 21h

exit:        
    int 20h
cseg ends
end start
