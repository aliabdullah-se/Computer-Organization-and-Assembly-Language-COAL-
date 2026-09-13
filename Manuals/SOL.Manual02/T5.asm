;Task4

[org 0x0100]            ;ZF    CF   SF   OF
 
mov ax, 0x1254       ;   0     0     0    0

mov bx, 0x0FFF       ;   0     0     0    0

add ax, 0xEDAB       ;   0     0     1    0

add ax, bx           ;   0     1     0    0

add bx, 0xF001       ;   1     1     0    0


mov ax, 0x4c00
int 0x21