extrn razlika:far
extrn nadji:far
data segment
    X dw -3
    Y dw 5
    Z dw -14
    niz dw 1, 4, 4, 4, 5 ; primer 2: 1, 2, 3, 4, 5 ; primer 3: 1, 2, 2, 0, 5
    n dw 5 ; primer 2: 1
    br dw ?
data ends
stack segment
    dw 64 dup (?)
    bottom label word
stack ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    lea sp, bottom

    push X
    push Y
    call razlika

    push ax
    push Z
    call razlika

    lea bx, niz
    push bx
    mov cx, n ; broj elemenata niza ide u proceduru preko registra CX
    mov si, n
    shl si, 1 ; SI *= 2 jer je word duplo veci korak od byte

    sub si, 4 ; indeks pretposlednjeg
    mov dx, niz[si] ; element koji se trazi
    mov br, dx

    lea bx, br
    push [bx]
    call nadji

    mov bp, sp
    mov ax, [bp]
    mov br, ax ; u br smestamo broj ponavljanja


    mov ah, 4ch
    int 21h
code ends
end main