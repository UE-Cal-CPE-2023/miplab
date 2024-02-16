cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    start:
        jmp begin
        ; characters/strings
        ast db '*'
        ln1 db 'I'
        ln2 db 'WILL'
        ln3 db 'PASS'
        ln4 db 'NCP 2205'
        ; color attributes
        white_black db 7h
        blue_ltred db 61h
        red_green db 24h
        red_ltblue db 34h
        ; based on 80x25 text mode, 40 and 12 are center
        box_x db 29     ; 80 - 21 (box width) / 2
        box_y db 9      ; 25 - 6 (box height) / 2
    begin:
        ; clear screen
        mov ax, 003h
        int 10h

        ; set cursor position to starting pos
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        int 10h
        
        ; asterisks
        mov ah, 09h
        mov al, ast
        mov bl, white_black
        mov cx, 21
        int 10h

        ; move cursor below -- y + 1, x + 10
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, 1
        add dl, 10
        int 10h

        ; first text line -- I
        mov ah, 13h
        mov al, 01h
        mov bl, blue_ltred
        lea bp, ln1
        mov cx, 1
        int 10h

        ; move cursor below -- y + 2, x + (21 - 4)/2
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, 2
        add dl, 9
        int 10h

        ; second text line -- WILL
        mov ah, 13h
        mov al, 01h
        mov bl, white_black
        lea bp, ln2
        mov cx, 4
        int 10h

        ; move cursor below -- y + 3, x + (21 - 4)/2
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, 3
        add dl, 9
        int 10h

        ; third text line -- PASS
        mov ah, 13h
        mov al, 01h
        mov bl, red_green
        lea bp, ln3
        mov cx, 4
        int 10h

        ; move cursor below -- y + 4, x + (21 - 8)/2
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, 4
        add dl, 7
        int 10h

        ; fourth text line -- NCP 2205
        mov ah, 13h
        mov al, 01h
        mov bl, red_ltblue
        lea bp, ln4
        mov cx, 8
        int 10h

        ; move cursor below y, left starting x
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, 5
        int 10h

        ; asterisks
        mov ah, 09h
        mov al, ast
        mov bl, white_black
        mov cx, 21
        int 10h
	
        ; pause and wait for keyboard press
 	    mov ah, 01
        int 21h
       
        int 20h
        cseg ends
end start