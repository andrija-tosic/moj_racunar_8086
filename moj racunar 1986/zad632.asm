data segment
niz dw 5, 4, 3, 9, 1, 3, 3ah, 4ch
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

    mov ax, 0FFFFh ; min
    pet2:
        cmp niz[si], ax
        jge nije
        mov ax, niz[si]
        mov bx, si ; u bx min indeks
    nije:
        sub si, 2
    loop pet2
    mov niz[bx], 0FFFFh ; brise se min
    mov cx, dx
    stosw
loop pet1
    mov ah, 4ch
    int 21h
code ends
end main