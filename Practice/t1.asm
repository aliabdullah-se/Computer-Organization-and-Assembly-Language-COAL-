[org 0x0100]

mov ax, 0      ; Clear the accumulator to 0

;[YOUR CODE HERE]
mov bx, 6      ; storing 6 into bx
add ax, bx   ;6  ; adding now has 6, 6 times to ax
add ax, bx   ;12  
add ax, bx   ;18
add ax, bx   ;24
add ax, bx   ;30
add ax, bx   ;36



mov ax, 0x4c00 ; Terminate program
int 0x21