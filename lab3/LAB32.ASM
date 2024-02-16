cseg segment para 'code'
    assume cs:cseg, ds:cseg, es:cseg, ss:cseg
    org 100h
    
    start:
        jmp begin
        ; characters/strings
        ast db '*'
        spc db ' '
        ; color attributes
        white_black db 7h
        blue_ltred db 61h
        ; based on 80x25 text mode, 40 and 12 are center
        box_x db 23     ; 80 - 21 (box width) / 2
        box_y db 5      ; 25 - 6 (box height) / 2

    begin:
        ; clear screen
        mov ax, 003h
        int 10h

        ; set cursor position for line 1
        mov cl, 0
        call offset_y_by_cl

        ; line 1
        mov cx, 7
        call draw_void_cx
        mov cx, 5
        call draw_ast_cx
        mov cx, 11
        call draw_void_cx
        mov cx, 5
        call draw_ast_cx

        ; set cursor for line 2
        mov cl, 1
        call offset_y_by_cl

        ; line 2
        mov cx, 4
        call draw_void_cx
        mov cx, 4
        call draw_ast_cx
        mov cx, 3
        call draw_spc_cx
        mov cx, 4
        call draw_ast_cx
        mov cx, 5
        call draw_void_cx
        mov cx, 4
        call draw_ast_cx
        mov cx, 3
        call draw_spc_cx
        mov cx, 4
        call draw_ast_cx

        ; set cursor for line 3
        mov cl, 2
        call offset_y_by_cl

        ; line 3
        mov cx, 2
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 9
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 1
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 9
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx

        ; set cursor for line 4
        mov cl, 3
        call offset_y_by_cl

        ; line 4
        mov cx, 1
        call draw_void_cx
        mov cx, 2
        call draw_ast_cx
        mov cx, 13
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 13
        call draw_spc_cx
        mov cx, 2
        call draw_ast_cx

        ; set cursor for line 5
        mov cl, 4
        call offset_y_by_cl

        ; line 5
        mov cx, 2
        call draw_ast_cx
        mov cx, 15
        call draw_spc_cx
        mov cx, 1
        call draw_ast_cx
        mov cx, 15
        call draw_spc_cx
        mov cx, 2
        call draw_ast_cx

        ; set cursor for line 6
        mov cl, 5
        call offset_y_by_cl

        ; line 6
        mov cx, 2
        call draw_ast_cx
        mov cx, 29
        call draw_spc_cx
        mov cx, 2
        call draw_ast_cx

        ; set cursor for line 7
        mov cl, 6
        call offset_y_by_cl

        ; line 7
        mov cx, 1
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 26
        call draw_spc_cx
        mov cx, 2
        call draw_ast_cx

        ; set cursor for line 8
        mov cl, 7
        call offset_y_by_cl

        ; line 8
        mov cx, 3
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 22
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx

        ; set cursor for line 9
        mov cl, 8
        call offset_y_by_cl

        ; line 9
        mov cx, 5
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 18
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx

        ; set cursor for line 10
        mov cl, 9
        call offset_y_by_cl

        ; line 10
        mov cx, 7
        call draw_void_cx
        mov cx, 4
        call draw_ast_cx
        mov cx, 12
        call draw_spc_cx
        mov cx, 4
        call draw_ast_cx

        ; set cursor for line 11
        mov cl, 10
        call offset_y_by_cl

        ; line 11
        mov cl, 10
        call draw_void_cx
        mov cx, 4
        call draw_ast_cx
        mov cx, 7
        call draw_spc_cx
        mov cx, 4
        call draw_ast_cx

        ; set cursor for line 12
        mov cl, 11
        call offset_y_by_cl

        ; line 12
        mov cx, 13
        call draw_void_cx
        mov cx, 3
        call draw_ast_cx
        mov cx, 3
        call draw_spc_cx
        mov cx, 3
        call draw_ast_cx

        ; set cursor for line 13
        mov cl, 12
        call offset_y_by_cl

        ; line 13
        mov cx, 15
        call draw_void_cx
        mov cx, 5
        call draw_ast_cx

        ; set cursor for line 14
        mov cl, 13
        call offset_y_by_cl

        ; line 14
        mov cx, 17
        call draw_void_cx
        mov cx, 1
        call draw_ast_cx

        jnz exit

    ; draw a number of asterisks based on the value of cx
    draw_ast_cx:
        mov ah, 09h
        mov al, ast
        mov bl, blue_ltred
        int 10h
        mov ah, 02
        add dl, cl
        int 10h
        ret

    ; draw space characters based on the value of cx
    draw_spc_cx:
        mov ah, 09h
        mov al, spc
        mov bl, blue_ltred
        int 10h
        mov ah, 02
        add dl, cl
        int 10h
        ret

    ; draw space characters outside the heart based on the value of cx
    draw_void_cx:
        mov ah, 09h
        mov al, spc
        mov bl, white_black
        int 10h
        mov ah, 02
        add dl, cl
        int 10h
        ret

    ; move the cursor to the specified y offset
    offset_y_by_cl:
        mov ah, 02
        mov dh, box_y
        mov dl, box_x
        add dh, cl
        int 10h
        ret

    exit:
        ; pause and wait for keyboard press
        mov ah, 01
        int 21h
        int 20h 
    cseg ends
end start