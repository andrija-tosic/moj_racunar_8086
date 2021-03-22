code segment
    assume cs:code
main:
    mov ax, 7FFFh
    add ax, 5
    adc dx, 0

    mov ah, 4ch
    int 21h
code ends
end main