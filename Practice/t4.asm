num1: dw 1
num2: db 10
sum: dw 0

[org 0x0100]
    mov ax, [num1]
    mov bl, [num2]
    add ax, bx
    mov [sum], ax

    mov ax, 0x4c00 ; terminate program
    int 0x21