[org 0x0100]

jmp start

x: dw 25
y: dw 40
result: dw 0

start:
    mov ax, [x]
    mov bx, [y]

    cmp ax, bx
    jg x_greater

    ; else branch: result = y - x
    mov ax, bx
    sub ax, [x]
    jmp store

x_greater:
    ; if branch: result = x - y
    sub ax, bx

store:
    mov [result], ax

    mov ax, 0x4c00
    int 0x21
