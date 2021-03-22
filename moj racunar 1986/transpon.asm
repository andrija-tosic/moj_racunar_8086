data segment
    mat1 dd 11111111h, 22222222h
         dd 33333333h, 44444444h
         dd 55555555h, 66666666h

    mat2 dd 6 dup (0)
    n dw 3
    m dw 2
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    xor bx, bx
    xor di, di

    mov cx, n
petV:
    mov dx, cx
    
    xor si, si
    xor bp, bp

    mov cx, m
    petK:
        mov ax, word ptr mat1[bx][si]
        mov word ptr mat2[bp][di], ax

        mov ax, word ptr mat1[bx][si+2]
        mov word ptr mat2[bp][di+2], ax

        shl n, 1
        shl n, 1
        add bp, n ; brze menjanje vrste mat2
        shr n, 1
        shr n, 1
        add si, 4 ; brze menjanje kolone mat1

    loop petK
    mov cx, dx

        shl m, 1
        shl m, 1
        add bx, m ; sporije menjanje vrste mat1
        shr m, 1
        shr m, 1
        add di, 4 ; sporije menjanje kolone mat2
    
loop petV
    mov ah, 4ch
    int 21h
code ends
end main