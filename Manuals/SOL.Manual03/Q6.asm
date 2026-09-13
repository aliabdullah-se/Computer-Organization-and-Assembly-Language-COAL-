[org 0x0100]

jmp start

arr: dw 5, 3, 8, 4, 1
n: dw 5
i: dw 0
j: dw 0

start:
    mov word [i], 0

outer_loop:
    mov ax, [i]
    mov bx, [n]
    dec bx
    cmp ax, bx
    jge outer_done          ; conditional jump: stop when i >= n-1

    mov word [j], 0
    mov si, arr

inner_loop:
    mov ax, [j]
    mov bx, [n]
    dec bx
    sub bx, [i]              ; bx = (n-1-i) = comparisons remaining this pass
    cmp ax, bx
    jge inner_done            ; conditional jump: end of this pass

    mov ax, [si]
    mov bx, [si + 2]
    cmp ax, bx
    jle no_swap                ; conditional jump: already in order

    mov [si], bx                ; swap
    mov [si + 2], ax

no_swap:
    add si, 2
    inc word [j]
    jmp inner_loop                ; unconditional jump back to inner loop

inner_done:
    inc word [i]
    jmp outer_loop                  ; unconditional jump back to outer loop

outer_done:
    mov ax, 0x4c00
    int 0x21
