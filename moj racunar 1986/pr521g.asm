extrn zbir:far
data segment
    n db 5
    niz db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
    suma dw ?
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
    lea di, niz
    push di
    mov al, n
    mov ah, 0
    push ax
    lea di, suma
    push di
    call zbir

    mov ah, 4ch
    int 21h
code ends
end main