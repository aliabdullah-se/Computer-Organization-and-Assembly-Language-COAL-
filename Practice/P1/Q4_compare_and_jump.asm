[org 0x0100]

jmp start

num1: dw 50
num2: dw 30

start:
    mov ax, [num1]
    mov bx, [num2]

    cmp ax, bx
    jg increment
    jmp decrement

increment:
    inc word [num1]
    jmp done

decrement:
    dec word [num1]

done:
    mov ax, 0x4c00
    int 0x21
