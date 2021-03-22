data segment
    MIN db -24
    MAX db 24
    X0 db 7Fh
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov bp, word ptr X0
    and bp, 0FF00h

    mov al, MIN
    cbw
    mov bx, ax ; u bx je min
    inc bx

    mov bp, 0FFFFh ; minY inicijalizacija

petlja:
    cmp bx, 0
    je nije_manji
    xor dx, dx
    xor ax, ax
    mov al, bl
    mov cl, 3
    imul cl ; u AX je 3x
    imul bx ; 3x^2 u DX:AX
    sub ax, 50
    sbb dx, 0

    xor cx, cx
    mov cx, bx
    add cx, 125
    cmp ax, cx
    idiv cx ; rez u AX, ostatak u DX

    cmp dx, bp ; trenutno y sa min_y
    jge nije_manji

    mov bp, dx ; u bp je minY (min ostatak)

    mov X0, bl ; smestamo x za min_y

nije_manji:
    inc bx
    cmp bl, MAX
    jle petlja

    mov ah, 4ch
    int 21h
code ends
end main