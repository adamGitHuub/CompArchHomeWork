.model small
.stack 100h
.data 
array dw 16 DUP(0)

.code
main PROC 
    mov ax,@data
    mov ds, ax

    mov bx, 0    ;початкову зміщення масиву
    mov cx, 0    ;лічильник
    mov ax, 3    ;число з якого починаєм

array_loop:
    mov [array + bx], ax    
    add bx, 6                
    add ax, 3                  
    add cx, 1                 
    cmp cx, 5               
    jne array_loop          

    mov ax, 4C00h
    int 21h
main ENDP
END main

