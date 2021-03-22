data segment
    ;niz1 db 1, 2, 3, 0FFh, 9,8,7,6, 2Ah, 00h
    niz1 db 4, 3, 10, 5, 0FFh, 1,12,43,2Ah,6, 2Ah, 00h
    niz2 db 32 dup (?)
data ends
code segment
    assume cs:code, ds:data, es:data
main:
    mov ax, data
    mov ds, ax
    mov es, ax

    mov dx, 128 ; max

    lea di, niz1
    mov al, 0
    mov cx, dx
    repne scasb
    sub dx, cx ; u dx je n
    mov cx, dx
    lea di, niz1
    mov al, 0FFh
    repne scasb ; DI ukazuje na FFh + 1
    test cx,cx ; da li ima FFh
    jz nema
    jmp ima
nema:
    mov cx, dx ; cx = n
    lea si, niz1
    lea di, niz2
    rep movsb
    jmp kraj
ima:
    mov cx, di
    dec cx

    lea si, niz1
    lea di, niz2
    rep movsb ; SI ukazuje na FFh+1, kao i DI

    dec di  

    lea si, niz1
    add si, dx
    dec si
    std
pet:
    movsb
    add di, 2
loop pet
    cld
    lea di, niz1
    mov cx, dx
    mov al, 2Ah
    repne scasb
    test cx, cx
    jz kraj
    stc
 kraj:
    mov ah, 4ch
    int 21h
code ends
end main