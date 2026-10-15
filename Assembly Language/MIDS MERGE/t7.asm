[org 0x100]
jmp start

arr: db 7,4,8,2,7,7,9,5,6,1

start:
    mov  si, arr
    mov  cx, 9            ; 10 elements, first one is the seed
    mov  bl, [si]         ; BL = max
    mov  bh, bl           ; BH = min
    inc  si
next:
    mov  al, [si]
    cmp  al, bl
    jbe  notmax           ; al <= max, skip
    mov  bl, al
notmax:
    cmp  al, bh
    jae  notmin           ; al >= min, skip
    mov  bh, al
notmin:
    inc  si
    loop next
    mov  ax, 0x4c00       ; BL = 9, BH = 1
    int  0x21