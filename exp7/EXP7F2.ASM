cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h
start: 
    jmp begin
    str1 db 'I Love You 143$'
    var db ?
begin:
    mov ax, 0003h
    int 10h    
    
    lea si, str1
    mov cx, 20
x1:
    lodsb
    mov var, al
    cmp var, 61h
    jae x2
    jmp prt
x2:
    cmp var, 7Ah                  
    jbe convert 
    jmp prt
convert:    
    and var, 11011111B
prt:
    mov ah, 02h
    mov dl, var
    int 21h
    loop x1 
    
    int 20h
cseg ends
end start
