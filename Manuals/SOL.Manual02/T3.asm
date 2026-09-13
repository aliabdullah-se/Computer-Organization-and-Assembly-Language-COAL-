;Task1

[org 0x0100]

mov ax, [0x0025]    ;copied the content in ax
mov [0x0FFF], ax    ;Moved the contents of ax
mov bl, [0x0010]    ;Moved the contents of the memory location
mov [0x002F], bl

mov ax, 0x4c00
int 0x21