[org 0x100]
jmp start

roll: db 4,1,9,5            ; CHANGE to your last 4 roll digits
a: db 0
b: db 0
c: db 0
d: db 0
Mr1: db 0,0,0,0
Mr2: db 0,0,0,0             ; 0,a,b,0
Mr3: db 0,0,0,0             ; 0,c,d,0
Mr4: db 0,0,0,0
Nr1: db 0,0                 ; d,c
Nr2: db 0,0                 ; b,a
Or1: dw 0,0,0
Or2: dw 0,0,0
Or3: dw 0,0,0

hdr:    db 'The result of Matrix Convolution is:',13,10,'$'
bar:    db '  | $'
comma:  db ', $'
endbar: db ' |',13,10,'$'

; ---------- Activity 1 ----------
LoadMN:
    mov al,[roll]
    mov [a],al
    mov [Mr2+1],al
    mov [Nr2+1],al
    mov al,[roll+1]
    mov [b],al
    mov [Mr2+2],al
    mov [Nr2],al
    mov al,[roll+2]
    mov [c],al
    mov [Mr3+1],al
    mov [Nr1+1],al
    mov al,[roll+3]
    mov [d],al
    mov [Mr3+2],al
    mov [Nr1],al
    ret

; ---------- Activity 2 ----------
MatConv:
    mov bp, Or1             ; output pointer
    xor si, si              ; i = 0
ci:
    xor di, di              ; j = 0
cj:
    xor dx, dx              ; sum = 0
    mov bx, si
    shl bx, 2
    add bx, di              ; bx = i*4 + j  (top-left of window)
    mov al,[Mr1+bx]         ; window row 0
    mul byte [Nr1]
    add dx, ax
    mov al,[Mr1+bx+1]
    mul byte [Nr1+1]
    add dx, ax
    mov al,[Mr1+bx+4]       ; window row 1 (next M row = +4)
    mul byte [Nr2]
    add dx, ax
    mov al,[Mr1+bx+5]
    mul byte [Nr2+1]
    add dx, ax
    mov [bp], dx            ; store O[i][j]
    add bp, 2
    inc di
    cmp di, 3
    jb  cj
    inc si
    cmp si, 3
    jb  ci
    ret

; ---------- print AX in decimal (preserves all regs) ----------
PrintNum:
    push ax
    push bx
    push cx
    push dx
    mov bx, 10
    xor cx, cx
p1: xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz p1
p2: pop dx
    add dl, '0'
    mov ah, 2
    int 0x21
    loop p2
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; ---------- Activity 3 ----------
PrintMat:
    mov dx, hdr
    mov ah, 9
    int 0x21
    mov bx, Or1
    mov cx, 3               ; 3 rows
row:
    mov dx, bar
    mov ah, 9
    int 0x21
    mov si, 3               ; 3 columns
col:
    mov ax, [bx]
    call PrintNum
    add bx, 2
    dec si
    jz  endrow
    mov dx, comma
    mov ah, 9
    int 0x21
    jmp col
endrow:
    mov dx, endbar
    mov ah, 9
    int 0x21
    loop row
    ret

start:
    call LoadMN
    call MatConv
    call PrintMat
    mov ax, 0x4c00
    int 0x21