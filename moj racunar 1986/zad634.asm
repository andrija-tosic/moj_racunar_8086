data segment
    niz dw 4,3,2,1,5,6,7,8,6 ; 1,2,3,4,8,7,6,6,5
    druginiz dw 9 dup (?)
    broj dw 9
data ends
code segment
    assume cs:code, ds:data, es:data
main:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea di, druginiz
    mov cx, broj
    shr cx, 1
pet1:
    mov dx, cx
    mov cx, broj
    shr cx, 1
    mov si, 0
    mov ax, 7FFFh
    pet2:
        cmp niz[si], ax
        jge nije1
        mov ax, niz[si] ; min
        mov bx, si ; bx = min_i
    nije1:
        add si, 2
    loop pet2
    mov niz[bx], 7FFFh
    mov cx, dx
    stosw
loop pet1
    mov cx, broj
    shr cx, 1
    inc cx
pet3:
    mov dx, cx
    mov cx, broj
    shr cx, 1
    inc cx
    mov si, cx
    shl si, 1
    sub si, 2
    mov ax, -32768
    pet4:
        cmp niz[si], ax
        jle nije2
        mov ax, niz[si] ; max
        mov bx, si ; bx = max_i
    nije2:
        add si, 2
    loop pet4
    mov niz[bx], -32768
    mov cx, dx
    stosw
loop pet3
    mov ah, 4ch
    int 21h
code ends
end main