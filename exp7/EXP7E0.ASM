cseg segment para 'code'
assume cs:cseg, ds:cseg, ss:cseg
org 100h
start: 
    jmp begin
    msg1   db  'Enter any character:$'
	msg2   db  10,13,'Output:$'
	out1   db  'BIT 0 IS LOGIC 1$'
	out2   db  'BIT 0 IS LOGIC 0$'
begin:
    mov ax, 0003h
    int 10h    
    
    mov ah, 09h
    lea dx, msg1
    int 21h  
    
    mov ah, 01
    int 21h
    mov ah, 09h
    lea dx, msg2
    int 21h
	
    and al, 00000001B
    jz no

    mov ah, 09h
    lea dx, out1
    int 21h
    loop exit

no:
    mov ah, 09h
    lea dx, out2
    int 21h
    
exit:   
    int 20h
cseg ends
end start