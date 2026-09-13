;Task3

[org 0x0100]

mov cx, 6           ; Setting loop counter to 6 (for 6 elements)
mov si, 5           ; SI points to the last index of var1 (byte array: offsets 0 to 5)
mov di, 0           ; DI points to the first index of var2 (word array)

reverse_loop:
    mov al, [var1 + si]   ; Reading byte from source (starts from end)
    mov ah, 0             ; Clearing high byte to safely convert byte to word
    mov [var2 + di], ax   ; Storing word into destination (starts from beginning)
    
    dec si                ; Moving backward by 1 byte in source array
    add di, 2             ; Moving forward by 2 bytes in destination word array
    
    sub cx, 1             ; Decrementing loop counter
    jnz reverse_loop      ; Jumping back if CX is not zero

; Terminate program cleanly
mov ax, 0x4c00
int 0x21

; Variable declaration and arrays initialization

var1: db 7, 6, 5, 4, 3, 2       ; 6-byte source array
var2: dw 0, 0, 0, 0, 0, 0       ; 6-word destination array (initialized to 0)
