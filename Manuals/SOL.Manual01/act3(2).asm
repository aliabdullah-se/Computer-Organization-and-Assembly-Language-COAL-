;This is Approach 2 to the given Program

[org 0x0100]
mov ax, 2    ; moving 2 using a single ax register
add ax, 4    ; adding next even number to the register
add ax, 6    ; adding next even number to ax register
add ax, 8    ; adding next even number to ax register 
add ax, 0x4c00  ;program termination
int 0x21
             ;hence the addition of even numbers upto 20 is done using a single register
