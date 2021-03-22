data segment
br1 dd 0FFFFFFFFh
broj dd 0h
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov ax, word ptr br1
    mov cl, 10h
    rotat:
        rcr ax, 1
        adc bx, 0
    loop rotat
    mov cl, 10h
    mov ax, word ptr br1[2]
    rotat2:
        rcr ax, 1
        adc bx, 0
    loop rotat2

    mov word ptr broj, bx

    mov ah, 4ch
    int 21h
code ends
end main