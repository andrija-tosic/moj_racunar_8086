data segment
    niz db 1,2,3,4
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    lea di, niz
    mov byte ptr [di], 5
code ends
end main