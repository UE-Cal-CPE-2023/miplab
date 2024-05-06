cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h
start: 
    jmp begin
    var db 10111110B
begin:
    mov ax, 0003h
    int 10h    
    
    not var

    mov ah, 02h
    mov dl, var
    int 21h
        
    int 20h
cseg ends
end start
