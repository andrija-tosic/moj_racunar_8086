data segment
    niz dw 1, 2, 5, 4, 10
    broj db 5
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov ch, 0
    mov cl, broj

    mov si, 0
    mov ax, niz[si]
    add si, 2

    petlja:
        cmp niz[si], ax
        ja veci
        jmp manji
        veci:
            mov ax, niz[si]
        manji:
        add si, 2
    loop petlja

    mov ah, 4ch
    int 21h
code ends
end main