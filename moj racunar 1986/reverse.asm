data segment
    ulaz db 1,2,3,4,'$'
    izlaz db 10 dup (?)
    max db 16
data ends
code segment
    assume cs:code, ds:data, es:data
main:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea di, ulaz ; za brojanje n
    mov al, '$' ; za cmp
    mov cl, max
    mov ch, 0
    repne scasb
    mov si, di ; si za ulaz
    sub si, 2 ; pocev od poslednjeg el

    lea di, izlaz ; di za izlaz
    mov cx, si
    sub cx, offset ulaz ; n-1
    inc cx ; n u cx
pet:
    movsb
    sub si, 2 ; da si ide unazad
loop pet
    stosb ; na kraju izlaza $

    mov ah, 4ch
    int 21h
code ends
end main