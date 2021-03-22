data segment
N db 8
NIZ dw 1, 2, 302h, 4, 5, 6067h, 7ch, 18h
data ends

code segment
assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    mov SI, 1
    mov ax, NIZ[SI]
    mov ah, 4ch
    int 21h
code ends
end main