code segment
    assume cs:code
main:
    mov dx, 003Ah
    mov ax, 0101h
    mov cx, 010FFh
    div cx

    mov ah, 4ch
    int 21h
code ends
end main