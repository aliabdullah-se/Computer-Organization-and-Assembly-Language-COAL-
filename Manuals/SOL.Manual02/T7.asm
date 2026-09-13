;Task 5

[org 0x0100]
jmp start

N: dw 6
sum: dw 0

start:
    mov cx, [N]       ; Initializing loop counter with N
    mov ax, 0         ; Clearing AX to act as the accumulator

sum_loop:
    add ax, cx        ; Adding current value of CX to AX
    loop sum_loop     ; Decrementing CX and loop if not zero

    mov [sum], ax     ; Storing the final result in memory

    mov ax, 0x4c00    ; Terminate program
    int 0x21