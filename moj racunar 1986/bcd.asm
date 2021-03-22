code segment
    assume cs:code
    bcd proc far

    xor ax, ax
    mov al, bl
    add al, bh
    aaa
    ret
bcd endp
code ends
end