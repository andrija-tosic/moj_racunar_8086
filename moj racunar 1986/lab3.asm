data segment
    niz1 dw 1, 2, 0, 4 ; drugi primer: 10, 6, 9, 8
    broj dw 4 ; primer 0: 10, primer 1: 1, primer 2: -1, primer 3: 0
    niz2 dw 0FEh, 0FFh, 0ABh, 0C3h ; drugi primer: 5, 3, 1, 7 
    niz3 dd 0ABCDFC13h, 0FFFFBAFCh, 0ADDABABAh, 4ABBCA2Eh, 3DFDF31Ah, 0 ; drugi primer: 9, 3, 12, 43, 2, 0
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    xor ax,ax
    xor dx,dx
    xor ch,ch
    mov cl, byte ptr broj
    mov si, 0
    petlja:
        mov ax, niz2[si]
        sub niz1[si], ax
        add si, 2
    loop petlja

    mov si, 0

    mov dx, word ptr niz3[si] ; nizih 16b
    mov cx, word ptr niz3[si+2] ; visih 16b

    add si, 4

    maks:
        cmp word ptr niz3+[si+2], cx ; poredjenje visih 16b
        ja veci_visi_deo ; u ovom slucaju sigurno je veci
        jb nisu_veci_oba ; ako je visi deo manji onda je sigurno ceo broj manji
        cmp word ptr niz3[si], dx ; poredjenje nizih 16b u slucaju da su visi delovi jednaki
        jb nisu_veci_oba
    veci_visi_deo:
            mov cx, word ptr niz3[si+2] ; max visi 16b u cx
            mov dx, word ptr niz3[si] ; max nizi 16b u dx

    nisu_veci_oba:
        cmp word ptr niz3[si], 0
        je kraj

        add si, 4

        jmp maks

    kraj:
        mov word ptr niz3[si], dx
        mov word ptr niz3[si+2], cx

    mov ah, 4ch
    int 21h
code ends
end main