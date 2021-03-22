data segment
    niz32 dd 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh
    n db 4
    zbir dd ?, ?
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov ch, 0
    mov cl, n
    mov ax, 0
    mov dx, 0
    mov si, 0

    sabiranje:
        add ax, word ptr niz32[si]
        adc dx, 0
        adc bx, 0
        add dx, word ptr niz32[si]+2
        adc bx, 0 ; zbir u BX:DX:AX
        
        add si, 4
    loop sabiranje

    mov word ptr zbir, AX
    mov word ptr zbir+2, dx
    mov word ptr zbir+4, bx

    mov ah, 4ch
    int 21h
code ends
end main