;This is the program for the rotation of three registers

[org 0x0100]

mov ax, 5     ;pushing 5 to ax
mov bx, 15    ;pushing 15 to bx
mov cx, 25    ;pushing 25 to cx

mov dx, cx    ; saving the cx
mov cx, ax    ; pushing ax to cx
mov ax, bx    ; pushing bx to ax
mov bx, dx    ; pushing ds to bx
add ax, 0x4c00 ; program termination
int 0x21


;the rotation of three registers is done using a temporary register