;This is our First Assembly Language Program
;This Program adds 3 numbers in the registers
[org 0x0100] ;Org Directive
mov ax, 5       ;AX = 5
mov bx, 10      ;BX = 10
add ax, bx      ;AX = AX + BX
mov bx, 15      ;BX = 15
add ax, bx      ;AX = AB + BX
mov ax, 0x4c00  ;terminate the program
int 0x21 

