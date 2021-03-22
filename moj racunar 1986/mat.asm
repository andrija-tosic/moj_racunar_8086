data segment
    mat dw 1, 2, 3
        dw 4, 5, 6
        dw 7, 8, 9
    broj db 0
    n db 3
    niz dw 16 dup (?)
    m dw 0
data ends


code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    
    mov bx,0
    mov di,0

    mov dh, 1 ; indeks kolone

    mov cl, n
    xor ch,ch
    kol:

        mov dl, 1 ; indeks vrste
        mov bp, cx
        mov cl, n
        mov si, 0
        vrs:

            mov al, dh
            sub al, dl
            cmp al, 0
            jge poz
            neg al
        poz:
            cmp al, broj
            jne nije

            mov ax, mat[bx][si]
            mov niz[di], ax
            add di, 2

            nije:
            inc dl
            
            add si,2
        loop vrs
        mov cx, bp
        mov al, n
        xor ah, ah
        shl ax, 1
        add bx, ax
        inc dh
    loop kol

    shr di, 1
    mov m, di

    mov ah, 4ch
    int 21h
    code ends
    end main
