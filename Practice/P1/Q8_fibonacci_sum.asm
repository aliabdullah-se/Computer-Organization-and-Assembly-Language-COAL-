[org 0x0100]

jmp start

arr: dw 4, 5, 8, 13, 15, 21, 22, 34, 40, 55
n: dw 10
fib: dw 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
fibcount: dw 11
sum: dw 0
idx: dw 0

start:
    mov word [idx], 0
    mov si, arr

array_loop:
    mov ax, [idx]
    cmp ax, [n]
    je array_done             ; conditional jump: processed all elements

    mov ax, [si]                ; current array element
    mov bx, fib
    mov cx, 0                     ; fib table index counter

fib_loop:
    cmp cx, [fibcount]
    je next_element                ; conditional jump: no match found

    cmp ax, [bx]
    je found_match                   ; conditional jump: match found

    add bx, 2
    inc cx
    jmp fib_loop                       ; unconditional jump back to fib check

found_match:
    add [sum], ax

next_element:
    add si, 2
    inc word [idx]
    jmp array_loop                       ; unconditional jump back to array loop

array_done:
    mov ax, 0x4c00
    int 0x21
