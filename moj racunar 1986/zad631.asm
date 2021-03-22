data segment
    niz dw "bc", "AE", "AE", "AE", "zg", "AE", "xy"
    duz db 6
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    lea si, niz
    mov cl, duz
    mov ch, 0
    mov dx, 0
    mov bx, 0
    mov bp, 'AE'

pet:
    lodsw
    cmp ax, bp
    jne nije
    inc bx
    cmp bx, dx
    jbe dalje
    mov dx, bx
    jmp dalje
nije:
    mov bx, 0
dalje:
loop pet

    mov ah, 4ch
    int 21h
code ends
end main