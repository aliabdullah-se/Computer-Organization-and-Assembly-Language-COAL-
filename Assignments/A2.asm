[org 0x0100]

jmp start

; Data Declaration
Array1: dw 3, 5, 7, 4, 9, 2, 1, 0, 12, 16 
Array2: dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   

start:
    mov dx, 10          ; Outer loop counter (10 elements)
    mov si, 0           ; Initialize array pointer to 0

outer_loop:
    mov cx, [Array1+si] ; Load the number into CX (for inner loop counter)
    mov bx, [Array1+si] ; Load the number into BX (for addition)
    mov ax, 0           ; Clear accumulator (AX will hold the square)

    cmp cx, 0           ; Check if the number is 0 (The Zero Trap)
    jz save_result      ; If 0, skip the addition loop (square of 0 is 0)

inner_loop:
    add ax, bx          ; Add the number to AX
    loop inner_loop     ; CX automatically decrements; jumps if CX != 0

save_result:
    mov [Array2+si], ax ; Store the calculated square into Array 2
    add si, 2           ; Move pointer to the next 16-bit word (2 bytes)
    dec dx              ; Subtract 1 from our outer loop counter
    jnz outer_loop      ; If DX is not 0, jump back to process next number

mov ax, 0x4C00          ; Terminate program
int 0x21