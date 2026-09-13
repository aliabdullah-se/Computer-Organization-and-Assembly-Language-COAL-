[org 0x0100]

jmp start

temp: dw 45
category: dw 0

start:
    mov ax, [temp]

    cmp ax, 0
    jl freezing
    cmp ax, 24
    jle cold
    cmp ax, 69
    jle moderate
    jmp hot

freezing:
    mov word [category], 1
    jmp done

cold:
    mov word [category], 2
    jmp done

moderate:
    mov word [category], 3
    jmp done

hot:
    mov word [category], 4

done:
    mov ax, 0x4c00
    int 0x21
