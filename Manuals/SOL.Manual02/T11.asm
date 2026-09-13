;Task 9

[org 0x0100]
jmp start

Array1: dw 1, 2, 3, 4, 5, 6
Array2: dw 0, 0, 0, 0, 0, 0

start:
    mov cx, 6         ; Looping counter for 6 elements
    mov si, 10        ; Offset of the last element in Array1 (5th index * 2 bytes)
    mov di, 0         ; Offset of the first element in Array2

rev_loop:
    mov ax, [Array1 + si] ; Loading element from end of Array1
    mov [Array2 + di], ax ; Storing element at beginning of Array2
    
    sub si, 2         ; Moving SI backwards
    add di, 2         ; Moving DI forwards
    loop rev_loop

    mov ax, 0x4c00    
    int 0x21