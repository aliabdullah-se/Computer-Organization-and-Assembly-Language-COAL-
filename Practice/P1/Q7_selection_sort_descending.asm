[org 0x0100]

jmp start

arr: dw 12, 45, 3, 67, 23, 9
n: dw 6
i: dw 0
maxidx: dw 0
j: dw 0

start:
    mov word [i], 0

outer_loop:
    mov ax, [i]
    mov bx, [n]
    dec bx
    cmp ax, bx
    jge outer_done             ; conditional jump: stop when i >= n-1

    mov ax, [i]
    mov [maxidx], ax             ; assume arr[i] is the max so far

    mov ax, [i]
    inc ax
    mov [j], ax                    ; j = i+1

inner_loop:
    mov ax, [j]
    cmp ax, [n]
    jge inner_done                   ; conditional jump: reached end of array

    mov si, [j]
    add si, si                         ; si = j*2 (word offset)
    mov bx, arr
    add bx, si
    mov ax, [bx]                        ; ax = arr[j]

    mov si, [maxidx]
    add si, si
    mov bx, arr
    add bx, si
    cmp ax, [bx]
    jle skip_update                       ; conditional jump: arr[j] not bigger

    mov ax, [j]
    mov [maxidx], ax                        ; found new max index

skip_update:
    inc word [j]
    jmp inner_loop                            ; unconditional jump back to inner loop

inner_done:
    mov ax, [i]
    cmp ax, [maxidx]
    je no_swap                                  ; conditional jump: max already in place

    mov si, [i]
    add si, si
    mov bx, arr
    add bx, si                                    ; bx -> arr[i]
    mov ax, [bx]

    mov si, [maxidx]
    add si, si
    mov cx, arr
    add cx, si                                      ; cx -> arr[maxidx]
    mov dx, [cx]

    mov [bx], dx
    mov [cx], ax                                      ; swap arr[i] and arr[maxidx]

no_swap:
    inc word [i]
    jmp outer_loop                                      ; unconditional jump back to outer loop

outer_done:
    mov ax, 0x4c00
    int 0x21
