.model small
.stack 100h
.data 
array dw 16 DUP(0)

.code
main PROC 
    mov ax, @data
    mov ds, ax

   
    mov bx, 0        ; Початкове зміщення масиву
    mov cx, 0        ; Лічильник
    mov ax, 3        ; Початкове значення для заповнення масиву

array_loop:
    mov [array + bx], ax    
    add bx, 6                
    add ax, 3                  
    add cx, 1                 
    cmp cx, 5               
    jne array_loop          

    ; Обнулення масиву перед заповненням числами Фібоначчі
    mov bx, 0
    mov cx, 16        ; Кількість елементів у масиві

zero_loop:
    mov word ptr [array + bx], 0    ; Обнулення кожного елемента масиву
    add bx, 2                       ; зміщення на 2 байти 
    loop zero_loop                  ; Повторення, поки не обнулиться весь масив

   
    mov word ptr [array], 0      ; Перше число Фібоначчі (F(0)) = 0
    mov word ptr [array + 2], 1  ; Друге число Фібоначчі (F(1)) = 1

    mov bx, 4                  ; Початкове зміщення для запису наступних чисел
    mov cx, 14                 ; Лічильник ітерацій для наступних чисел Фібоначчі

fib_loop:
    mov ax, [array + bx - 2]   ; Завантаження F(i-1)
    add ax, [array + bx - 4]   ; Додавання F(i-2)
    mov [array + bx], ax       ; Запис F(i) в масив

    add bx, 2                  ; Збільшення зміщення для наступного елемента масиву
    loop fib_loop              ; Повторення циклу для наступних чисел Фібоначчі

    
    mov ax, 4C00h
    int 21h

main ENDP
END main