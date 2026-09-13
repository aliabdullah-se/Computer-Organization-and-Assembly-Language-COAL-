;Sum of First 4 Even Numbers Program 
[org 0x0100]
mov ax, 2    ;ax is made to accumulate the sum
mov bx, 4    ;bx is storing the current even number
add ax, bx   ;ax is now the register to accumulate the sum of even numbers
mov bx, ax    ;now bx is stored with the next even number which is 6 and ax has the sum which is also 6
add ax, bx    ;now the accumulated sum in ax is 12 and the bx will store the next even number to sum.
mov bx, 8     ;the bx register is accumulating the next even number so that we can get the sum again of the even numbers
add ax, bx
mov ax, 0x4c00 ;to terminate the program
int 0x21    
 