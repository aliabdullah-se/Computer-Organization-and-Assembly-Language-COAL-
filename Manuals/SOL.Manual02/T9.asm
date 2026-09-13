;Task 7

[org 0x0100]
jmp start

num: dw 5
square: dw 0

start:
    mov cx, [num]     ; Looping counter set to num
    mov bx, [num]     ; Number to add set to num
    mov ax, 0         ; Clearing accumulator

sq_loop:
    add ax, bx        ; Adding num to AX
    loop sq_loop      ; Repeating 'num' times

    mov [square], ax  ; Storing the squared result

    mov ax, 0x4c00    
    int 0x21