[org 0x0100]

jmp start

start:
    push word 20          ; Vertical length
    push word 40          ; Horizontal length
    call PrintPlus
    add sp, 4              ; Remove 2 word parameters

    mov ax, 0x4C00
    int 0x21

PrintPlus:
    push bp
    mov bp, sp
    push cx
    push di
    push es

    mov ax, 0xB800
    mov es, ax             ; Video memory segment

    ; Horizontal line: row 9, starting column 0
    mov di, 1440           ; 2 * (9 * 80)
    mov cx, [bp+4]         ; Horizontal length = 40

horizontal:
    mov word [es:di], 0x0F2A ; White asterisk
    add di, 2
    loop horizontal

    ; Vertical line: column 10, starting row 0
    mov di, 20              ; 2 * column 10
    mov cx, [bp+6]          ; Vertical length = 20

vertical:
    mov word [es:di], 0x0F2A
    add di, 160             ; Move down one screen row
    loop vertical

    pop es
    pop di
    pop cx
    pop bp
    ret