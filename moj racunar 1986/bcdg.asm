extrn bcdp:far

data segment
A db 9,9,9,9,9,9,9,9,9,4,3,1,3,5,0, 0FFh
B dd ?
data ends

stack segment
dw 16 dup (?)
s label word
stack ends

code segment
    assume cs:code, ds:data, ss:stack
main:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax

    lea sp, s

    mov ax, offset A
    push ax
    mov ax, offset B - offset A - 1
    push ax

    call bcdp
    pop word ptr B+2
    pop word ptr B

    mov ah, 4ch
    int 21h 

code ends
end main