[org 0x0100]
	
mov ax, num1
mov ax, 0 
mov ax, [num1]
mov ax, 0
mov al, [num1]
mov ax, 0
mov ah, [num1]
mov ax, 0	

mov ax, num2
mov ax, 0
mov ax, [num2]
mov ax, 0
mov al, [num2]
mov ax, 0
mov ah, [num2]
mov ax, 0

mov ax, num3
mov ax, 0
mov ax, [num3]
mov ax, 0
mov al, [num3]
mov ax, 0
mov ah, [num3]
mov ax, 0	

mov ax, num3+1
mov ax, 0
mov ax, [num3+1]
mov ax, 0
mov al, [num3+1]
mov ax, 0
mov ah, [num3+1]
mov ax, 0	

mov ax, num3+2
mov ax, 0
mov ax, [num3+2]
mov ax, 0
mov al, [num3+2]
mov ax, 0
mov ah, [num3+2]
mov ax, 0

mov ax, 0x4c00 ; terminate program
int 0x21

num1: dw 0102h
num2: db 03h
num3: dd 04050607h