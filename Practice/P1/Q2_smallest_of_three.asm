[org 0x0100]

jmp start

nums: dw 15, 8, 22
smallest: dw 0

start:
    mov ax, [nums]
    mov bx, [nums + 2]
    mov dx, [nums + 4]

    cmp ax, bx
    jb skip1
    mov ax, bx        ; ax = min(nums[0], nums[1])

skip1:
    cmp ax, dx
    jb skip2
    mov ax, dx          ; ax = min(ax, nums[2])

skip2:
    mov [smallest], ax

    mov ax, 0x4c00
    int 0x21
