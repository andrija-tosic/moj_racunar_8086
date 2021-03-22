code segment
    assume cs:code
main:
    mov dx, 7FFFh
    mov ax, 0FFFFh
    mov bx, 10
    idiv bx

    mov ah, 4ch
    int 21h
code ends
end