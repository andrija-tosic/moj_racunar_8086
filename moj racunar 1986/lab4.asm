data segment
    ; niz db 'OVO JE NEKA RECENICA.', 0FFh, '$'
    ; niz 4F 56 4F 20 4A 45 20 4E 45 4B 41 20 52 45 43 45 4E 49 43 41 2E

    ; rez 'OVo Je NEKa RECENICA.'
    ; rez 4F 56 6F 20 4A 65 20 4E 45 4B 61 20 52 45 43 45 4E 49 43 41 2E

    ; niz db 'RISC procesorI su buducnost?', 0FFh, '$'
    niz db 'x86 procesori NISU PROSLOST.', 0FFh, '$'
data ends

code segment
    assume cs:code, ds:data, es:data
main:
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ah, 09h
    lea dx, niz
    int 21h ; stampanje niza pre izmene

    cld

    lea di, niz ; priprema za brojanje n sa scasb
    mov ax, 00FFh ; cisti se ah i u al FF

    mov cx, 128 ; neki max buffer za pretragu
    repne scasb ; nakon ovoga DI ukazuje na prvi bajt nakon 0FFh, pomeraj je n + offset niz

    mov cx, di ; cx = offset niz + n
    sub cx, offset niz ; u cx je n, u nizu moze se javiti maksimalno n razmaka
    mov bx, cx ; cuvanje n

    lea di, niz

petlja:
    mov dx, cx ; cuvanje cx jer instrukcije sa nizovima koriste cx

    mov cx, bx ; u cx se vraca n za rad instrukcija sa nizovima
    mov al, ' '
    repne scasb ; nakon ovoga DI ukazuje na prvi bajt nakon razmaka
    dec di ; DI -> ' '
    dec di ; DI -> slovo pre ' '
    mov si, di ; jer lodsb radi sa SI
    lodsb ; AL = slovo, SI -> ' '
    cmp al, 'A'
    jb nije_veliko
    cmp al, 'Z'
    ja nije_veliko

    add al, 'a' - 'A' ; veliko u malo
    dec si ; da se vrati na mesto slova pre ' '
    
    mov di, si ; jer stosb radi sa DI
    stosb ; zamena malim slovom, DI -> ' '
    inc di ; DI -> char nakon razmaka
    jmp kraj

nije_veliko:
    add di, 2 ; DI -> char nakon razmaka

kraj:
    mov cx, dx ; vracanje cx
loop petlja
    
    mov ah, 09h
    lea dx, niz
    int 21h ; stampanje niza nakon izmene

    mov ah, 4ch
    int 21h

code ends
end main