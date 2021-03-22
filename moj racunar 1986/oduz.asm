code segment
assume cs:code
main:
    mov ax, 7FFFh
    mov bx, 0FFFFh
    sub ax, bx
    mov dx,1
    sbb dx,0
    int 21h
code ends
end main