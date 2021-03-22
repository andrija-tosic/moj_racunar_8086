data segment
    niz1 dw 6, 3, 7, 4
    niz2 dw 3, 4, 10, 2
    brojel dw 4
    zbir1 dd ?
    zbir2 dd ?
    razlika dd ?
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov cx, brojel
    mov dx,0
    mov ax,0
    mov si,0
    prva:
        add ax, niz1[si]
        adc dx, 0
        add si, 2
    loop prva
    mov word ptr zbir1, ax
    mov word ptr zbir1+2, dx
    mov ax, 0
    mov dx, 0
    mov si, 0
    mov cx, brojel
    druga:
        add ax, niz2[si]
        adc dx,0
        add si, 2
    loop druga
    mov word ptr zbir2, dx
    mov word ptr zbir2+2, ax
    sub ax, word ptr zbir1
    sbb dx, 0
    mov word ptr razlika, ax
    mov word ptr razlika+2, dx

    mov ah, 4ch
    int 21h
code ends
end main