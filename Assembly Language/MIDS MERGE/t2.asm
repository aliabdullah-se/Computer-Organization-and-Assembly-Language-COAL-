[org 0x0100]

jmp start

; Data Declaration
Coefficients: dw 3, 4, 5
X:            dw 2
N:            dw 2
Result:       dw 0

start:
    push word [N]
    push word [X]
    push word Coefficients
    call PolyFunc
    add sp, 6

    mov ax, 0x4C00
    int 0x21

PolyFunc:
    push bp
    mov bp, sp

    push si
    push bx
    push cx
    push di

    mov si, [bp+4]     ; Address of coefficients
    mov bx, [bp+6]     ; X
    mov cx, [bp+8]     ; Degree N
    inc cx             ; Number of coefficients = N+1

    mov di, 1          ; Current power = X^0
    mov word [Result], 0

calculate:
    mov ax, [si]       ; Load current coefficient
    mul di             ; AX * DI -> DX:AX
    add [Result], ax   ; Add current term to result

    mov ax, di
    mul bx             ; Calculate next power
    mov di, ax

    add si, 2          ; Next word in coefficient array
    loop calculate

    pop di
    pop cx
    pop bx
    pop si

    pop bp
    ret