[org 0x100]
jmp start

MyArray: db 1,2,1,3,4,7,9,3,2,5
size:    dw 10

; params: [bp+4] = array address, [bp+6] = size (overwritten with new size)
RemoveDup:
    push bp
    mov  bp, sp
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov  bx, [bp+4]       ; array base
    mov  cx, [bp+6]       ; original size
    mov  dx, 1            ; w = write index (arr[0] always stays)
    mov  si, 1            ; i = read index
outer:
    cmp  si, cx
    jae  fill
    mov  al, [bx+si]      ; current element
    xor  di, di           ; j = 0
inner:
    cmp  di, dx           ; search only the kept part arr[0..w-1]
    jae  unique
    cmp  al, [bx+di]
    je   dup
    inc  di
    jmp  inner
unique:
    mov  di, dx
    mov  [bx+di], al      ; arr[w] = arr[i]
    inc  dx               ; w++
dup:
    inc  si
    jmp  outer

fill:
    mov  si, dx           ; fill arr[w..size-1] with -1
fl:
    cmp  si, cx
    jae  fdone
    mov  byte [bx+si], -1
    inc  si
    jmp  fl
fdone:
    mov  [bp+6], dx       ; return new size in the size slot

    pop  di
    pop  si
    pop  dx
    pop  cx
    pop  bx
    pop  ax
    pop  bp
    ret  2                ; removes the address only; size stays on the stack

start:
    push word [size]      ; pushed first -> becomes the return slot
    push MyArray          ; pushed second -> removed by ret 2
    call RemoveDup
    pop  ax               ; AX = new size = 7
    mov  [size], ax
    mov  ax, 0x4c00
    int  0x21 