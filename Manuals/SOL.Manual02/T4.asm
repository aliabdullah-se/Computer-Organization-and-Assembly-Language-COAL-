;Task2

[org 0x0100]
    var: dw 1234h        ; Declare 16-bit variable (0x1234)

    mov bx, var         ; Point BX to the memory location of the variable
    mov al, [bx]        ; Copying the first byte (low byte) into AL
    mov ah, [bx+1]      ; Copying the second byte (high byte) into AH

    mov [bx], ah        ; Putting the old high byte into the first memory slot
    mov [bx+1], al      ; Putting the old low byte into the second memory slot
     
    
mov ax, 0x4c00
int 0x21