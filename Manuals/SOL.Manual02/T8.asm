;Task 6 


[org 0x0100]
jmp start

array: dw 2, 4, 2, 8, 2, 1, 3, 2, 9, 2
target: dw 2
freq: dw 0

start:
    mov cx, 10        ; Array size for loop counter
    mov bx, 0         ; BX will act as the array index offset
    mov dx, 0         ; DX will be the frequency counter
    mov ax, [target]  ; Loading target number into AX for comparison

freq_loop:
    cmp ax, [array + bx] ; Comparing target with current array element
    jne skip_inc         ; If not equal, skip the increment
    inc dx               ; If equal, increment frequency counter

skip_inc:
    add bx, 2         ; Moving to the next word (2 bytes forward)
    loop freq_loop    ; Repeating for all elements

    mov [freq], dx    ; Storing final frequency

    mov ax, 0x4c00    
    int 0x21