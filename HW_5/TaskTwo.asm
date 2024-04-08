.model small
.stack 100h

.data

.code
main PROC
    mov ax, @data
    mov ds, ax


    mov ax, 48
    mov bx, 18
    call gcd ; Виклик функції НСД з числами у регістрах AX і BX


    mov ax, 4C00h 
    int 21h     
main ENDP


gcd PROC
    cmp ax, bx    ; Порівнюємо числа
    jz done       ; Якщо числа однакові, то НСД = число (ax або bx)

    jg greater    ; Якщо ax > bx, переходимо до greater
    jb less       ; Якщо ax < bx, переходимо до less

greater:
    sub ax, bx    ; ax = ax - bx
    jmp gcd       ; Повторюємо процедуру зі зменшеним значенням ax

less:
    sub bx, ax    ; bx = bx - ax
    jmp gcd       ; Повторюємо процедуру зі зменшеним значенням bx

done:
    ret           ; Повертаємо результат НСД у регістрі AX
gcd ENDP

END main