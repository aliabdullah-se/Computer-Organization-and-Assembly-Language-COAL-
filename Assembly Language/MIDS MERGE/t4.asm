[org 0x0100]
jmp start

start:
    push word 20        ; Vertical line length
    push word 40        ; Horizontal line length
    call PrintPlus
    add sp, 4           ; Clean up 2 parameters

    mov ax, 0x4C00
    int 0x21            ; Exit to DOS


PrintPlus:
    push bp
    mov bp, sp

    push cx
    push di
    push es

    mov ax, 0xB800
    mov es, ax          ; Video memory segment

    ; Horizontal line: row 9, column 0
    mov di, 1440        ; 2 * (9 * 80 + 0)
    mov cx, [bp+4]      ; Length = 40

horizontal:
    mov word [es:di], 0x0F2A  ; White '*' on black
    add di, 2
    loop horizontal

    ; Vertical line: row 0, column 10
    mov di, 20          ; 2 * (0 * 80 + 10)
    mov cx, [bp+6]      ; Length = 20

vertical:
    mov word [es:di], 0x0F2A
    add di, 160         ; Move down one row
    loop vertical

    pop es
    pop di
    pop cx
    pop bp
    ret