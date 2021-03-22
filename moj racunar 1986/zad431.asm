data segment
    niz dw 2, 5, 14, 32, 16, "#"
    zbir dd ?
    broj dw ?
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov ax,0
    mov dx,0
    mov bx,0
    mov si,0
    sabiranje:
        mov cx, niz[si]
        cmp cx, "#"
        je kraj
        add ax, cx
        adc dx, 0
        cmp cx, 77
        jb veci
        add si, 2
        jmp sabiranje

    veci:
        cmp cx, 5
        ja prebroj
        add si, 2
        jmp sabiranje

    prebroj:
        inc bx
        add si, 2
        jmp sabiranje

    kraj:
    mov word ptr zbir, ax
    mov word ptr zbir+2, dx
    mov broj, bx

    mov ah, 4ch
    int 21h
code ends
end main