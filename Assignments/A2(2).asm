[org 0x0100]

jmp start

; Data Declaration
Array1: dw 3, -5, 7, 4, -9, 2, 1, 0, 12, -16 
Max: dw 0

start:
    mov si, 0             ; Initialize array pointer at index 0
    mov ax, [Array1+si]   ; Load the very first number as our baseline "champion"
    mov cx, 9             ; Set loop counter for the 9 remaining numbers

check_next:
    add si, 2             ; Move pointer forward by 2 bytes to the next number
    cmp ax, [Array1+si]   ; Compare current champion (AX) with the new challenger
    jge skip_update       ; Signed jump: If champion is Greater or Equal, do nothing

    mov ax, [Array1+si]   ; Update: The challenger won, move it into AX

skip_update:
    loop check_next       ; Automatically subtract 1 from CX and repeat if not zero

    mov [Max], ax         ; Loop finished, store the absolute highest number into Max variable

mov ax, 0x4c00            ; Terminate program safely
int 0x21