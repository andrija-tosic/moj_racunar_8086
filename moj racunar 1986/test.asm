data segment
    prvi dw 0FFFFh
    drugi db 02h
data ends

code segment
assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    mov ax, prvi
    mov dx, 0
    mov cx, 0
    mov cx, drugi
    mov ah, 4ch
    int 21h
code ends
end main