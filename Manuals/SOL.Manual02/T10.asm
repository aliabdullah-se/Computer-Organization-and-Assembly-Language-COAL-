;Task 8

[org 0x0100]
jmp start

Fib: times 10 dw 0    ; Reserve space for 10 words, initialized to 0

start:
    mov bx, Fib       ; Base address for the array
    mov word [bx], 0      ; Fib[0] = 0
    mov word [bx + 2], 1  ; Fib[1] = 1

    mov cx, 8         ; 8 remaining terms to calculate
    mov si, 4         ; Offset for Fib[2]

fib_loop:
    mov ax, [bx + si - 4] ; Loading Fib[n-2]
    add ax, [bx + si - 2] ; Adding Fib[n-1]
    mov [bx + si], ax     ; Storing result in Fib[n]
    
    add si, 2         ; Moving to the next word slot
    loop fib_loop

    mov ax, 0x4c00    
    int 0x21