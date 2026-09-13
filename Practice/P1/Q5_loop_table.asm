[org 0x0100]

jmp start

num: dw 5
counter: dw 1
limit: dw 10
table: times 10 dw 0      ; will hold num*1, num*2, ... num*10

start:
    mov bx, table          ; bx = pointer into table array

loop_start:
    mov ax, [counter]
    cmp ax, [limit]
    jg loop_end             ; conditional jump: exit when counter > limit

    mov ax, [num]
    mov dx, [counter]
    mul dx                    ; ax = num * counter
    mov [bx], ax
    add bx, 2

    inc word [counter]
    jmp loop_start             ; unconditional jump back to top of loop

loop_end:
    mov ax, 0x4c00
    int 0x21
