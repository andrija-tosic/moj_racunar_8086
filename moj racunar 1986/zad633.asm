data segment
niz dw 1, 2, 3, 9, 4, 6, 3ah, 4ch
sort dw 8 dup (?)
broj dw 8
data ends

code segment
    assume cs:code, ds:data, es:data
main:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea di, sort
    mov cx, broj


pet1:
    mov dx, cx

    mov cx, broj
    mov si, cx
    shl si, 1
    sub si, 2

    mov ax, niz[0] ; max
    pet2:
        cmp niz[si], ax
        jle nije
        mov ax, niz[si]
        mov bx, si ; u bx max indeks
    nije:
        sub si, 2
    loop pet2
    mov niz[bx], -32768 ; brise se max
    mov cx, dx
    stosw
loop pet1
    mov ah, 4ch
    int 21h
code ends
end main