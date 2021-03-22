data segment
br1 dw 0F0E0h
broj db ?
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    
    mov cl, 10h
    mov broj, 0
    rotate:
        rcr br1, 1
        adc broj, 0
    loop rotate

    mov ah, 4ch
    int 21h
code ends
end main