.Model large

.Stack 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Data
.Data

score                       db 0
previous_time               db ?
shape_kind                  db 0; ;0 = horizontal    ;1 = square     ;2 = L_Shape    ;3 = T_Shape    ;4 = S_Shape
next_shape_kind             db 0; ;0 = horizontal    ;1 = square     ;2 = L_Shape    ;3 = T_Shape    ;4 = S_Shape
next_next_shape_kind        db 0; ;0 = horizontal    ;1 = square     ;2 = L_Shape    ;3 = T_Shape    ;4 = S_Shape
rows                        dw ?
cols                        dw ?
left_move_validation        dw 1
right_move_validation       dw 1
down_move_validation        dw 1
rotation_validation         dw 1
shape_color                 db ?
next_shape_color            db ?
next_next_shape_color       db ?
f_is_pressed                db 0
first_element_of_filled_row dw 0 
rotation_state              db 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Cordinates
left_border                 dw 90
right_border                dw 230
down_border                 dw 190
top_border                  dw 20

blocks_in_row               db 14
blocks_in_col               db 17
blocks_in_screen            dw 238

block_up_side               db 0
block_down_side             db 0
block_left_side             db 0
block_right_side            db 0

block_up_side_word          dw 0
block_down_side_word        dw 0
block_left_side_word        dw 0
block_right_side_word       dw 0

row_index                   db 0
col_index                   db 0

block_size                  db 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Strings
game_over_string   db "GAME IS OVER!$"
msg_next           db "Next$"
msg_next_next      db "Next-Next$"
msg_score          db "Score:$"
msg_down           db "DOWN:$"
msg_left           db "LEFT:$"
msg_right          db "RIGHT:$"
value1             db "0000$"
value2             db "0000$"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Shapes(patterns)
                    ;top down left right
horizontal             dw 20,30,160,170
                       dw 20,30,170,180
                       dw 20,30,180,190
                       dw 20,30,190,200
                       dw 20,30,160,200
                       dw 1

horizontal_90          dw 20,30,160,170
                       dw 30,40,160,170
                       dw 40,50,160,170
                       dw 50,60,160,170
                       dw 20,60,160,170
                       dw 1

horizontal_180         dw 20,30,160,170
                       dw 20,30,170,180
                       dw 20,30,180,190
                       dw 20,30,190,200
                       dw 20,30,160,200
                       dw 1

horizontal_270         dw 20,30,160,170
                       dw 30,40,160,170
                       dw 40,50,160,170
                       dw 50,60,160,170
                       dw 20,60,160,170
                       dw 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
square                 dw 20,30,160,170
                       dw 20,30,170,180
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 20,40,160,180
                       dw 3

square_90              dw 20,30,160,170
                       dw 20,30,170,180
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 20,40,160,180
                       dw 3

square_180             dw 20,30,160,170
                       dw 20,30,170,180
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 20,40,160,180
                       dw 3

square_270             dw 20,30,160,170
                       dw 20,30,170,180
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 20,40,160,180
                       dw 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L_Shape                dw 20,30,160,170
                       dw 30,40,160,170
                       dw 40,50,160,170
                       dw 40,50,170,180
                       dw 20,50,160,180
                       dw 4

L_Shape_90             dw 30,40,160,170
                       dw 30,40,170,180
                       dw 30,40,180,190
                       dw 40,50,160,170
                       dw 30,50,160,190
                       dw 4

L_Shape_180            dw 20,30,160,170
                       dw 20,30,170,180
                       dw 30,40,170,180
                       dw 40,50,170,180
                       dw 20,50,160,180
                       dw 4

L_Shape_270            dw 30,40,150,160
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 20,30,170,180
                       dw 20,40,150,180
                       dw 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
T_Shape                dw 20,30,160,170
                       dw 20,30,170,180
                       dw 20,30,180,190
                       dw 30,40,170,180
                       dw 20,40,160,190
                       dw 5

T_Shape_90             dw 30,40,160,170
                       dw 20,30,170,180
                       dw 30,40,170,180
                       dw 40,50,170,180
                       dw 20,50,160,180
                       dw 5

T_Shape_180            dw 20,30,170,180
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 30,40,180,190
                       dw 20,40,160,190
                       dw 5

T_Shape_270            dw 20,30,170,180
                       dw 30,40,170,180
                       dw 40,50,170,180
                       dw 30,40,180,190
                       dw 20,50,170,190
                       dw 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 S_Shape               dw 20,30,160,170
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 40,50,170,180
                       dw 20,50,160,180
                       dw 6

 S_Shape_90            dw 40,50,150,160
                       dw 40,50,160,170
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 30,50,150,180
                       dw 6

 S_Shape_180           dw 20,30,160,170
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 40,50,170,180
                       dw 20,50,160,180
                       dw 6

 S_Shape_270           dw 40,50,150,160
                       dw 40,50,160,170
                       dw 30,40,160,170
                       dw 30,40,170,180
                       dw 30,50,150,180
                       dw 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 current_shape                    dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw ?

 current_shape_0                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw ?

 current_shape_90                 dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw ?

 current_shape_180                dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw ?

 current_shape_270                dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw 0,0,0,0
                                  dw ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 next_shape            dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw ?

 next_next_shape       dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw 0,0,0,0
                       dw ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Array                  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0     ;14 * 17 
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
ArrayUpperPart         db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
                       db 0,0,0,0,0,0,0,0,0,0,0,0,0,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Macros
show_number Macro msg,number,row,col
    Local L

    push ax
    push bx
    push cx
    push dx

    mov cx,10d
    xor bx,bx
    mov bx,3
    mov ah,0
    mov al,number
    
    L:
    xor dx,dx
    div cx     
    or dl,30h
    mov msg[bx],dl
    dec bx
    or ax,ax
    jne L

    display_string msg,row,col,4,8
    pop dx
    pop cx
    pop bx
    pop ax
endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_row Macro row,begin_col,end_col,color    
    Local L

    push ax
    push bx
    push cx
    push dx

    mov ah, 0ch
    mov al, color
    mov cx, begin_col
    mov dx, row
    L:
    int 10h
    inc cx
    cmp cx, end_col
    jl L

    pop dx
    pop cx
    pop bx
    pop ax
EndM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_column Macro col,begin_row,end_row,color
    Local L

    push ax
    push bx
    push cx
    push dx

    mov ah, 0ch
    mov al, color
    mov cx, col
    mov dx, begin_row
    L:
    int 10h
    inc dx
    cmp dx, end_row
    jl L

    pop dx
    pop cx
    pop bx
    pop ax
EndM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
copy Macro pattern_from,pattern_to 
    local L

    push ax
    push bx

    xor bx,bx
    L:
    mov ax,pattern_from[bx]
    mov pattern_to[bx],ax
    add bx,2
    cmp bx,40
    jle L

    pop bx
    pop ax
endm    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_string Macro msg,row,column,length,color
    push ax
    push bx
    push cx
    push dx

    mov ax, @data
    mov es, ax  
    
    mov ah, 13h         ; string writing
    mov al, 00h         ; move cursor
    xor bh, bh          ; page 0
    mov bl, color       ; set string color
    
    mov bp, offset msg  ; BP points to string to be printed
    mov cx, length      ; string length
    mov dh, row         ; row location
    mov dl, column      ; col location
    int 10h             ; draw the string

    pop dx
    pop cx
    pop bx
    pop ax
EndM 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_block Macro start_row, end_row, start_column, end_column, color_block
    Local L 

    push ax
    push bx
    push cx
    push dx

    mov dx, start_row
    L: 
    draw_row  dx, start_column, end_column,color_block
    inc dx
    cmp dx, end_row
    jle L 

    pop dx
    pop cx
    pop bx
    pop ax
EndM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
draw_shape Macro pattern
    Local L

    push ax
    push bx
    push cx
    push dx

    mov bx,0

    L:
    draw_block [pattern+bx],[pattern+bx+2],[pattern+bx+4],[pattern+bx+6],shape_color
        add bx,8
        cmp bx,24
        jle L

    pop dx
    pop cx
    pop bx
    pop ax
EndM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_black_shape Macro pattern
    Local L

    push ax
    push bx
    push cx
    push dx

    mov bx,0

    L:
    draw_block [pattern+BX],[pattern+BX+2],[pattern+BX+4],[pattern+BX+6],0
        add bx,8
        cmp bx,24
        jle L

    pop dx
    pop cx
    pop bx
    pop ax
EndM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MAIN
.CODE
MAIN PROC

    ;set data segment
    mov ax,@data
    mov ds,ax 

    call set_graphical_mode
    call draw_screen
    call set_first_shape_horizontal

    WHILE_TRUE:
    show_number value1,score,11,6
    call delay

    draw_black_shape current_shape
    call move_shape_down
    call check_keyboard
    call set_current_shape_color
    draw_shape current_shape
    call check_game_over
    jmp WHILE_TRUE
    
   MAIN ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Procedures
set_first_shape_horizontal proc near
    push ax

    copy horizontal,current_shape
    copy horizontal,current_shape_0
    copy horizontal_90,current_shape_90    
    copy horizontal_180,current_shape_180
    copy horizontal_270,current_shape_270

    mov ax,current_shape[40]        ;Set color of shape
    mov ah,0
    mov shape_color,al
    draw_shape current_shape

    pop ax
ret
set_first_shape_horizontal endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_graphical_mode proc near
    ;set screen 320x200
    mov AH,0
    MOV AL,13h
    int 10h
   
    ;set background color 
    mov ah,0bh
    mov bh,0
    mov bl,15
    int 10h
ret
set_graphical_mode endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay proc near
    WAIST_TIME:
    mov ah, 2ch
    int 21h
   
    cmp dl, previous_time
    je WAIST_TIME
    mov previous_time, dl

    WAIST_TIME2:
    mov ah, 2ch
    int 21h
   
    cmp dl, previous_time
    je WAIST_TIME2
    mov previous_time, dl

    WAIST_TIME3:
    mov ah, 2ch
    int 21h
   
    cmp dl, previous_time
    je WAIST_TIME3
    mov previous_time, dl
ret
delay endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
big_delay proc near
    WAIST_TIME4:
    mov ah, 2ch
    int 21h
   
    cmp dh, previous_time
    je WAIST_TIME4
    mov previous_time, dh

    WAIST_TIME5:
    mov ah, 2ch
    int 21h
   
    cmp dh, previous_time
    je WAIST_TIME5
    mov previous_time, dh

    WAIST_TIME6:
    mov ah, 2ch
    int 21h
   
    cmp dh, previous_time
    je WAIST_TIME6
    mov previous_time, dh
ret
big_delay endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_screen proc near
       
        ;draw_screen_play_area
        draw_row 19,89,230,3
        draw_column 89,19,191,3
        draw_column 230,19,191,3
        draw_row 191,89,230,3

        ;draw_screen_next_shape
        draw_row 10,20,80,2
        draw_column 20,10,60,2
        draw_column 80,10,60,2
        draw_row 60,20,80,2

        ;draw_screen_next_next_shape
        draw_row 10,240,300,2
        draw_column 240,10,60,2
        draw_column 300,10,60,2
        draw_row 60,240,300,2        
    
        ;draw_screen_strings
        display_string msg_next,8,4,4,2
        display_string msg_next_next,8,30,9,2
        display_string msg_score,11,0,6,5
ret    
draw_screen endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_left proc near

    push ax
    push bx

    mov ax,[si+36]      ;left border of pattern
    sub ax,10
    cmp ax,left_border
    jl exit1
    
    mov [si+36],ax
    mov ax,[si+38]
    sub ax,10
    mov [si+38],ax
   
    mov bx,4            ;go to start-col of block
    
    L1:     
    mov ax,[si+bx]
    sub ax,10
    mov [si+bx],ax
    
    add bx,2            ;go to end-col of block
    
    mov ax,[si+bx]
    sub ax,10
    mov [si+bx],ax
    
    add bx,6            ;go to next block
    
    cmp bx,28
    jle L1
    
    exit1:
        pop bx
        pop ax
ret
move_left endp   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_right proc near

    push ax
    push bx

    mov ax,[si+38]      ;right border of pattern  
    add ax,10
    cmp ax,right_border
    jg exit2
    
    mov [si+38],ax
    mov ax,[si+36]
    add ax,10
    mov [si+36],ax
        
    mov bx,4            ;go to start-col of block
    
    L2:     
    mov ax,[si+bx]
    add ax,10
    mov [si+bx],ax
    
    add bx,2            ;go to end-col of block
    
    mov ax,[si+bx]
    add ax,10
    mov [si+bx],ax
    
    add bx,6            ;go to next block
    
    cmp bx,28
    jle L2
    
    exit2:
        pop bx
        pop ax
ret
move_right endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_down proc near

    push ax
    push bx

    mov ax,[si+34]      ;down border of pattern  
    add ax,10
    cmp ax,down_border
    jg exit3
    
    mov [si+34],ax
    mov ax,[si+32]
    add ax,10
    mov [si+32],ax

    mov bx,0
    
    L3:
    mov ax,[si+bx]
    add ax,10
    mov [si+bx],ax
    
    add bx,2            ;go to down-edge of block
    
    mov ax,[si+bx]
    add ax,10
    mov [si+bx],ax
    
    add bx,6            ;go to next block of pattern
    
    cmp bx,24
    jle L3
  
    exit3:
        pop bx
        pop ax
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
is_down_move_valid proc near
    
    push ax
    push bx
    push cx
    push dx
    
    mov si,offset current_shape
    mov ax,[si+34]      ;down border of pattern  
    add ax,10
    cmp ax,down_border
    jg EXIT_AND_STOP_SHAPE  

    mov cx,2    ;go to down side of first block

    CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE:

    mov bx,cx
    mov dx,[si+bx]       ;down side of block
    mov ax,190
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    dec dx
    mov rows,dx
                        ;now dx has the distance of this block from down (in blocks)
    add cx,4            ;go to right side of block

    mov bx,cx
    mov dx,[si+bx]
    mov ax,230
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    mov cols,dx
                        ;now dx has the distance of this block from right (in blocks)

    mov ax,14           ;block count in a row
    mov bx,rows
    mul bx
    add ax,cols
                        ;now ax has index of down block of the block that we entered in CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE with
    mov bx,ax
    mov ah,Array[bx]
    cmp ah,0
    jne EXIT_AND_STOP_SHAPE
    
    add cx,4            ;go to down side of next block
    
    cmp cx,30
    jl CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE

    mov down_move_validation,1
    jmp exit4

    EXIT_AND_STOP_SHAPE:
    mov down_move_validation,0
    jmp exit4

    exit4:
    pop dx
    pop cx
    pop bx
    pop ax 
ret
is_down_move_valid endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
is_left_move_valid proc near
    push ax
    push bx
    push cx
    push dx
    
    mov si,offset current_shape
    mov ax,[si+36]      ;left border of pattern
    sub ax,10
    cmp ax,left_border
    jl SET_LEFT_MOVE_VALIDATION_0

    mov cx,2    ;go to down side of first block

    LOOP_FOR_ALL_BLOCKS_OF_THIS_SHAPE:

    mov bx,cx
    mov dx,[si+bx]       ;down side of block
    mov ax,190
    sub ax,dx
    xor bl,bl
    mov bl,10
    div bl
    mov dx,ax
    mov rows,dx
                        ;now dx has the distance of this block from down (in blocks)
    add cx,4            ;go to right side of block
    mov bx,cx

    mov dx,[si+bx]
    mov ax,230
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    mov cols,dx
                        ;now cx has the distance of this block from right (in blocks)

    mov ax,14           ;block count in a row
    mov bx,rows
    mul bx
    add ax,cols
    inc ax              ;left neighbor block in Array
                        ;now ax has index of down block of the block that we entered in CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE with
    mov bx,ax
    cmp Array[bx],0
    jne SET_LEFT_MOVE_VALIDATION_0
    
    add cx,4            ;go to down side of next block
    
    cmp cx,30
    jl LOOP_FOR_ALL_BLOCKS_OF_THIS_SHAPE
    mov left_move_validation,1
    jmp exit8

    SET_LEFT_MOVE_VALIDATION_0:
    mov left_move_validation,0

    exit8:
    pop dx
    pop cx
    pop bx
    pop ax 
ret
is_left_move_valid endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
is_right_move_valid proc near
    push ax
    push bx
    push cx
    push dx
    
    mov si,offset current_shape
    mov ax,[si+38]      ;right border of pattern  
    add ax,10
    cmp ax,right_border
    jg SET_RIGHT_MOVE_VALIDATION_0

    mov cx,2    ;go to down side of first block

    LOOP_FOR_ALL_BLOCKS_OF_THIS_SHAPE2:

    mov bx,cx
    mov dx,[si+bx]       ;down side of block
    mov ax,190
    sub ax,dx
    xor bl,bl
    mov bl,10
    div bl
    mov dx,ax
    mov rows,dx
                        ;now dx has the distance of this block from down (in blocks)
    add cx,4            ;go to right side of block
    mov bx,cx

    mov dx,[si+bx]
    mov ax,230
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    mov cols,dx
                        ;now cx has the distance of this block from right (in blocks)

    mov ax,14           ;block count in a row
    mov bx,rows
    mul bx
    add ax,cols
    dec ax              ;right neighbor block in Array
                        ;now ax has index of down block of the block that we entered in CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE with
    mov bx,ax
    cmp Array[bx],0
    jne SET_RIGHT_MOVE_VALIDATION_0
    
    add cx,4            ;go to down side of next block
    
    cmp cx,30
    jl LOOP_FOR_ALL_BLOCKS_OF_THIS_SHAPE2
    mov right_move_validation,1
    jmp exit9

    SET_RIGHT_MOVE_VALIDATION_0:
    mov right_move_validation,0

    exit9:
    pop dx
    pop cx
    pop bx
    pop ax 
ret
is_right_move_valid endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_shape_down proc near
    mov si,offset current_shape
    mov ax,[si+34]      ;down border of pattern  
    add ax,10
    cmp ax,down_border
    jg STOP_SHAPE2  

    call is_down_move_valid
    cmp down_move_validation,1
    je CALL_MOVE_DOWN2
   
    STOP_SHAPE2: 
    call stop_current_shape
    call initial_new_shape
    call initial_new_next_shape
    call initial_new_next_next_shape
    jmp exit13

    CALL_MOVE_DOWN2:
    call move_all_rotated_patterns_down    
    mov si,offset current_shape
    call move_down
    exit13:
ret
move_shape_down endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_keyboard proc near
    ;check if any key pressed
    mov ah,01h
    int 16h
    jz exit5_HELPER

    ;check which key is pressed
    mov ah,00h
    int 16h

    cmp al,61h  ;if 'a' is pressed
    je MOVE_LEFT_LABEL

    cmp al,64h  ;if 'd' is pressed
    je MOVE_RIGHT_LABEL

    cmp al,66h  ;if 'f' is pressed
    je SET_F_IS_PRESSED_1

    cmp al,73h  ;if 's' is pressed  
    je MOVE_DOWN_LABEL

    cmp al,77h  ;if 'w' is pressed
    je ROTATE_LABEL

    jmp exit5   ;press a not valid key

    ROTATE_LABEL:
    call rotate
    jmp exit5

    SET_F_IS_PRESSED_1:
    mov f_is_pressed,1
    jmp MOVE_DOWN_LABEL

    MOVE_LEFT_LABEL:
    call is_left_move_valid
    cmp left_move_validation,0
    je exit5
    mov si,offset current_shape 
    call move_left
    call move_all_rotated_patterns_left
    jmp exit5

    MOVE_RIGHT_LABEL:
    call is_right_move_valid
    cmp right_move_validation,0
    je exit5
    mov si,offset current_shape 
    call move_right
    call move_all_rotated_patterns_right
    jmp exit5

exit5_HELPER:
jmp exit5

    MOVE_DOWN_LABEL:
    call is_down_move_valid
    cmp down_move_validation,0
    je STOP_SHAPE
    call move_all_rotated_patterns_down    
    mov si,offset current_shape
    call move_down
    cmp f_is_pressed,1
    je MOVE_DOWN_LABEL
    jmp exit5
   
    STOP_SHAPE: 
    call stop_current_shape
    call initial_new_shape
    call initial_new_next_shape
    call initial_new_next_next_shape
    jmp exit5

exit5:
mov f_is_pressed,0  ;reset
ret
check_keyboard endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_all_rotated_patterns_left proc near
 
    mov si,offset current_shape_90
    call move_left
    mov si,offset current_shape_180
    call move_left
    mov si,offset current_shape_270
    call move_left
    mov si,offset current_shape_0
    call move_left
ret
move_all_rotated_patterns_left endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_all_rotated_patterns_right proc near

    mov si,offset current_shape_90
    call move_right
    mov si,offset current_shape_180
    call move_right
    mov si,offset current_shape_270
    call move_right
    mov si,offset current_shape_0
    call move_right
ret
move_all_rotated_patterns_right endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_all_rotated_patterns_down proc near

    mov si,offset current_shape_90
    call move_down
    mov si,offset current_shape_180
    call move_down
    mov si,offset current_shape_270
    call move_down
    mov si,offset current_shape_0
    call move_down
ret
move_all_rotated_patterns_down endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rotate proc near

    cmp rotation_state,0
    je LABEL_90

    cmp rotation_state,1
    je LABEL_180

    cmp rotation_state,2
    je LABEL_270

    cmp rotation_state,3
    je LABEL_0_HELPER

    LABEL_90:
    mov si,offset current_shape_90
    call check_is_rotation_valid
    cmp rotation_validation,1
    jne DONT_ROTATE
    copy current_shape_90,current_shape
    mov rotation_state,1
    DONT_ROTATE:    
    jmp exit20

    LABEL_180:
    mov si,offset current_shape_180
    call check_is_rotation_valid
    cmp rotation_validation,1
    jne DONT_ROTATE1
    copy current_shape_180,current_shape
    mov rotation_state,2
    DONT_ROTATE1:
    jmp exit20

    LABEL_0_HELPER:
    jmp LABEL_0

    LABEL_270:
    mov si,offset current_shape_270
    call check_is_rotation_valid
    cmp rotation_validation,1
    jne DONT_ROTATE2 
    copy current_shape_270,current_shape
    mov rotation_state,3
    DONT_ROTATE2:
    jmp exit20

    LABEL_0:
    mov si,offset current_shape_0
    call check_is_rotation_valid
    cmp rotation_validation,1
    jne DONT_ROTATE3
    copy current_shape_0,current_shape
    mov rotation_state,0
    DONT_ROTATE3:
    jmp exit20

    exit20:
    mov rotation_validation,0       ;reset
ret
rotate endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_current_shape_color proc near
    push ax
    mov ax,current_shape[40]
    mov ah,0
    mov shape_color,al
    pop ax
ret
set_current_shape_color endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_next_shape_color proc near
    push ax
    mov ax,next_shape[40]
    mov ah,0
    mov next_shape_color,al
    pop ax
ret
set_next_shape_color endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_next_next_shape_color proc near
    push ax
    mov ax,next_next_shape[40]
    mov ah,0
    mov next_next_shape_color,al
    pop ax
ret
set_next_next_shape_color endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stop_current_shape proc near
    push ax
    push bx
    push cx
    push dx
    push si

    mov cx,2    ;go to down side of first block

    DO_FOR_ALL_BLOCKS_OF_THIS_SHAPE:
    mov bx,cx
    mov dx,[si+bx]       ;down side of block
    mov ax,190
    sub ax,dx
    xor bl,bl
    mov bl,10
    div bl
    mov dx,ax
    mov rows,dx
                        ;now dx has the distance of this block from down (in blocks)
    add cx,4            ;go to right side of block
    mov bx,cx

    mov dx,[si+bx]
    mov ax,230
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    mov cols,dx
                        ;now cx has the distance of this block from right (in blocks)

    mov ax,14           ;block count in a row
    mov bx,rows
    mul bx
    add ax,cols
                        ;now ax has index of down block of the block that we entered in CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE with
    mov bx,ax
    mov al,[si+40]
    mov Array[bx],al
    
    add cx,4            ;go to down side of next block
    
    cmp cx,30
    jl DO_FOR_ALL_BLOCKS_OF_THIS_SHAPE

    call set_current_shape_color
    draw_shape current_shape
    call find_first_filled_row
    mov rotation_state,0
    pop si
    pop dx
    pop cx
    pop bx
    pop ax 
ret
stop_current_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_is_rotation_valid proc near
    push ax
    push bx
    push cx
    push dx
    push si

    mov cx,2    ;go to down side of first block

    DO_IT_FOR_ALL_BLOCKS_OF_THIS_SHAPE:
    mov bx,cx
    mov dx,[si+bx]       ;down side of block
    mov ax,190
    sub ax,dx
    xor bl,bl
    mov bl,10
    div bl
    mov dx,ax
    mov rows,dx
                        ;now dx has the distance of this block from down (in blocks)
    add cx,4            ;go to right side of block
    mov bx,cx

    mov dx,[si+bx]
    mov ax,230
    sub ax,dx
    xor bh,bh
    mov bl,10
    div bl
    mov dx,ax
    mov cols,dx
                        ;now cx has the distance of this block from right (in blocks)

    mov ax,14           ;block count in a row
    mov bx,rows
    mul bx
    add ax,cols
                        ;now ax has index of down block of the block that we entered in CHECK_FOR_ALL_BLOCKS_OF_THIS_SHAPE with
    mov bx,ax
    cmp Array[bx],0
    jne SET_ROTATION_VALIDATION_0
    
    add cx,4            ;go to down side of next block
    
    cmp cx,30
    jl DO_IT_FOR_ALL_BLOCKS_OF_THIS_SHAPE

    mov rotation_validation,1
    jmp exit19

    SET_ROTATION_VALIDATION_0:
    mov rotation_validation,0
    jmp exit19
    
    exit19:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax 
ret
check_is_rotation_valid endp



initial_new_shape proc near   
mov ah,next_shape_kind
mov shape_kind,ah

mov ah,next_next_shape_kind
mov next_shape_kind,ah

call choose_next_next_shape_kind_randomly


mov bh,shape_kind

cmp bh,0
je CREATE_A_HORIZONTAL

cmp bh,1
je CREATE_A_L_SHAPE

cmp bh,2
je CREATE_A_SQUARE

cmp bh,3
je CREATE_A_S_SHAPE

cmp bh,4
je CREATE_A_T_SHAPE

CREATE_A_HORIZONTAL:
    copy horizontal,current_shape
    call init_a_horizontal_shape
    jmp exit6

CREATE_A_L_SHAPE:
    copy L_Shape,current_shape
    call init_a_L_shape
    jmp exit6

CREATE_A_SQUARE:
    copy square,current_shape
    call init_a_square_shape
    jmp exit6

CREATE_A_S_SHAPE:
    copy S_Shape,current_shape
    call init_a_S_shape
    jmp exit6

CREATE_A_T_SHAPE:
    call init_a_T_shape
    copy T_Shape,current_shape

exit6:
ret
initial_new_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initial_new_next_shape proc near

mov ah,next_shape_kind

cmp ah,0
je CREATE_NEXT_HORIZONTAL

cmp ah,1
je CREATE_NEXT_L_SHAPE

cmp ah,2
je CREATE_NEXT_SQUARE

cmp ah,3
je CREATE_NEXT_S_SHAPE

cmp ah,4
je CREATE_NEXT_T_SHAPE

CREATE_NEXT_HORIZONTAL:
    copy horizontal,next_shape
    jmp exit10

CREATE_NEXT_L_SHAPE:
    copy L_Shape,next_shape
    jmp exit10

CREATE_NEXT_SQUARE:
    copy square,next_shape
    jmp exit10

CREATE_NEXT_S_SHAPE:
    copy S_Shape,next_shape
    jmp exit10

CREATE_NEXT_T_SHAPE:
    copy T_Shape,next_shape

exit10:
call move_next_shape_to_its_box
ret
initial_new_next_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
initial_new_next_next_shape proc near

mov ah,next_next_shape_kind

cmp ah,0
je CREATE_NEXT_NEXT_HORIZONTAL

cmp ah,1
je CREATE_NEXT_NEXT_L_SHAPE

cmp ah,2
je CREATE_NEXT_NEXT_SQUARE

cmp ah,3
je CREATE_NEXT_NEXT_S_SHAPE

cmp ah,4
je CREATE_NEXT_NEXT_T_SHAPE

CREATE_NEXT_NEXT_HORIZONTAL:
    copy horizontal,next_next_shape
    jmp exit100

CREATE_NEXT_NEXT_L_SHAPE:
    copy L_Shape,next_next_shape
    jmp exit100

CREATE_NEXT_NEXT_SQUARE:
    copy square,next_next_shape
    jmp exit100

CREATE_NEXT_NEXT_S_SHAPE:
    copy S_Shape,next_next_shape
    jmp exit100

CREATE_NEXT_NEXT_T_SHAPE:
    copy T_Shape,next_next_shape

exit100:
call move_next_next_shape_to_its_box
ret
initial_new_next_next_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
choose_next_next_shape_kind_randomly proc near
push ax
push bx
push dx

mov ah, 2ch     ;get time
int 21h

mov ah,0
mov al,dl
mov bl,5
div bl
mov next_next_shape_kind,ah

pop dx
pop bx
pop ax
ret
choose_next_next_shape_kind_randomly endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_a_horizontal_shape proc near
    copy horizontal,current_shape
    copy horizontal,current_shape_0
    copy horizontal_90,current_shape_90    
    copy horizontal_180,current_shape_180
    copy horizontal_270,current_shape_270
ret
init_a_horizontal_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_a_L_shape proc near
    copy L_Shape,current_shape
    copy L_Shape,current_shape_0
    copy L_Shape_90,current_shape_90    
    copy L_Shape_180,current_shape_180
    copy L_Shape_270,current_shape_270
ret
init_a_L_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_a_square_shape proc near
    copy square,current_shape
    copy square,current_shape_0
    copy square_90,current_shape_90    
    copy square_180,current_shape_180
    copy square_270,current_shape_270
ret
init_a_square_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_a_S_shape proc near
    copy S_Shape,current_shape
    copy S_Shape,current_shape_0
    copy S_Shape_90,current_shape_90    
    copy S_Shape_180,current_shape_180
    copy S_Shape_270,current_shape_270
ret
init_a_S_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
init_a_T_shape proc near
    copy T_Shape,current_shape
    copy T_Shape,current_shape_0
    copy T_Shape_90,current_shape_90    
    copy T_Shape_180,current_shape_180
    copy T_Shape_270,current_shape_270
ret
init_a_T_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_next_shape_to_its_box proc near
push ax
push bx

mov bx,4        ;left side of first block

MOVE_NEXT_SHAPE:
mov ax,next_shape[bx]
sub ax,130
mov next_shape[bx],ax

add bx,2

mov ax,next_shape[bx]
sub ax,130
mov next_shape[bx],ax

add bx,6
cmp bx,28
jle MOVE_NEXT_SHAPE

pop bx
pop ax 

call set_next_shape_color
    draw_block 11,59,21,79,0       ;reset next box
    call draw_next_shape
ret
move_next_shape_to_its_box endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_next_next_shape_to_its_box proc near
push ax
push bx

mov bx,4        ;left side of first block

MOVE_NEXT_NEXT_SHAPE:
mov ax,next_next_shape[bx]
add ax,90
mov next_next_shape[bx],ax

add bx,2

mov ax,next_next_shape[bx]
add ax,90
mov next_next_shape[bx],ax

add bx,6
cmp bx,28
jle MOVE_NEXT_NEXT_SHAPE

pop bx
pop ax 

call set_next_next_shape_color
    draw_block 11,59,241,299,0       ;reset next-next box
    call draw_next_next_shape
ret
move_next_next_shape_to_its_box endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_game_over proc near
push ax
push bx

mov bx,196
CHECK_GAME_OVER_CONDITION:
cmp Array[bx],0
jne CALL_GAME_OVER
inc bx
cmp bx,223
jl CHECK_GAME_OVER_CONDITION

jmp exit11

CALL_GAME_OVER:
call game_over

exit11:
pop bx
pop ax
ret
check_game_over endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_next_shape proc near

    push ax
    push bx
    push cx
    push dx

    MOV BX,0

    DRAWING_NEXT_SHAPE:
    draw_block [next_shape+BX],[next_shape+BX+2],[next_shape+BX+4],[next_shape+BX+6],next_shape_color
        ADD BX,8
        CMP BX,24
        JLE DRAWING_NEXT_SHAPE

    pop dx
    pop cx
    pop bx
    pop ax
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_next_next_shape proc near
    push ax
    push bx
    push cx
    push dx

    MOV BX,0

    DRAWING_NEXT_NEXT_SHAPE:
    draw_block [next_next_shape+BX],[next_next_shape+BX+2],[next_next_shape+BX+4],[next_next_shape+BX+6],next_next_shape_color
        ADD BX,8
        CMP BX,24
        JLE DRAWING_NEXT_NEXT_SHAPE

    pop dx
    pop cx
    pop bx
    pop ax
ret
draw_next_next_shape endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
game_over proc near

    SHOW_THIS:
    draw_block 0,200,0,320,0       ;reset next box
    display_string game_over_string,11,13,13,4
    display_string msg_score,13,14,6,2
    show_number value2,score,13,20

    mov cx,100
    DELAYS:
    call big_delay
    loop DELAYS
    jmp SHOW_THIS
game_over endp                                  ;game over proc has no ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_first_filled_row proc near
    push ax
    push bx
    push cx
    push dx
    push si

    mov bx,0
    INCREAMENT_ROW_START:
    mov si,0
    
    INCREAMENT_COL_START:
    cmp Array[bx+si],0
    je INCREAMENT_ROW_END
    inc si
    cmp si,13
    jle INCREAMENT_COL_START
    
    mov first_element_of_filled_row,bx
    call clear_first_filld_row
    sub bx,14

    INCREAMENT_ROW_END:
    add bx,14
    cmp bx,223
    jle INCREAMENT_ROW_START
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
ret
find_first_filled_row endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clear_first_filld_row proc near
    push ax
    push bx
    push cx
    push dx
    push si

    add score,10
    mov bx,0

    WRITE_IN_ALL_ELEMENTS_0: 
    mov si,first_element_of_filled_row
    mov Array[si+bx],0
    inc bx
    cmp bx,13
    jle WRITE_IN_ALL_ELEMENTS_0

    call shift_upper_rows
    call update_Array_in_ui
    call reset_upper_array

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
ret
clear_first_filld_row endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
shift_upper_rows proc near
    push ax
    push bx

    mov bx,first_element_of_filled_row

    SHIFT_ALL_UPPER_BLOCKS:
    mov al,Array[bx+14]
    mov Array[bx],al

    inc bx
    cmp bx,238
    jle SHIFT_ALL_UPPER_BLOCKS

    pop bx
    pop ax
ret
shift_upper_rows endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
update_Array_in_ui proc near
    push ax
    push bx
    push cx
    push dx
    push si

    mov bx,0
    LOOP_FOR_ALL_BLOCKS:
    ;row_index = i / blocks_in_row    col_index = i % blocks_in_row
    xor ax,ax
    mov al,bl
    mov dl,blocks_in_row
    div dl           ;al=qotient     ah=col_index
    call set_row_and_col_index
    ;call show_finded_borders_of_block
    ;block_right_side = right_border - col_index * 10       block_left_side = block_right_side - block_size 
    xor ax,ax
    mov al,col_index
    mul block_size

    mov cx,right_border
    sub cl,al           
    mov block_right_side,cl
    sub cl,block_size
    mov block_left_side,cl

    ;block_down_side = down_border - row_index * 10       block_up_side = block_down_side - block_size 
    xor ax,ax
    mov al,row_index
    mul block_size
    
    mov cx,down_border
    sub cl,al
    mov block_down_side,cl
    sub cl,block_size
    mov block_up_side,cl

    call change_block_vars_into_word
    draw_block block_up_side_word,block_down_side_word,block_left_side_word,block_right_side_word,Array[bx]

    inc bx
    cmp bx,blocks_in_screen
    jl LOOP_FOR_ALL_BLOCKS


    pop si
    pop dx
    pop cx
    pop bx
    pop ax
ret
update_Array_in_ui endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
change_block_vars_into_word proc near
    push ax 
    mov ah,0
    mov al,block_up_side
    mov block_up_side_word,ax

    mov ah,0
    mov al,block_down_side
    mov block_down_side_word,ax

    mov ah,0
    mov al,block_left_side
    mov block_left_side_word,ax

    mov ah,0
    mov al,block_right_side
    mov block_right_side_word,ax
    pop ax
ret
change_block_vars_into_word endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_row_and_col_index proc near
    mov row_index,al
    mov col_index,ah
ret
set_row_and_col_index endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
reset_upper_array proc near
    push ax
    push bx

    xor bx,bx
    MAKE_THEM_ALL_ZERO:
    mov ArrayUpperPart[bx],0
    add bx,1
    cmp bx,237
    jle MAKE_THEM_ALL_ZERO

    pop bx
    pop ax
ret
reset_upper_array endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
End main

     