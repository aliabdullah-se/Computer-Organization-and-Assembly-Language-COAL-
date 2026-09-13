[org 0x0100]
mov ax, 0 ; initialzes the ax with 0

;using ax for the word size 2 bytes 16 bits

add ax, [num1] ;added 0 + 1 = 1 so ax = 1
add ax, [num1 + 2] ;added 1 + 2 = 3 so ax = 3
add ax, [num1 + 4] ;added 3 + 3 = 6 so ax = 6
add ax, [num1 + 6] ;added 6 + 4 = 10 so ax = 10

;using bx = bh + bl for the word size 2 bytes 16 bits

mov bl, [num2] ; moved the number safely in lower bit 0010 
mov bh, 0 ;initialzes the bh register as 0 so it is cleared manually
add bl, [num2 + 1] ;added the 10 + 11 = 21 in the bl lower bytes of bx register
mov bh, 0 ;initialzes the bh register as 0 so it is cleared manually
add bl, [num2 + 2] ;added the 21 + 5 = 26 in bl the lower bytes of bx register
mov bh, 0 ;initialzes the bh register as 0 so it is cleared manually
add bl, [num2 + 3] ;added the 26 + 6 = 32 in bl the lower byte of bx register

; Finally accumalution of the sum as the ax, bx registers

add ax, bx ; accumulation of the sum in ax register 

; Incrementing the sum variable 

mov [sum], ax ; now the sum variable has the accumulated sum of all the numbers 

;The Final Accumulated sum is 42 and it is 0x2A

mov ax, 0x4c00 ; Program Termination
int 0x21

num1: dw 1, 2, 3, 4
num2: db 10, 11, 5, 6
sum: dw 0