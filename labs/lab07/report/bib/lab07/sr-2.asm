%include 'in_out.asm'
SECTION .data
    msg_x: DB 'Введите значение переменной x: ', 0
    msg_a: DB 'Введите значение переменной a: ', 0
    msg_result: DB 'Результат: ', 0
SECTION .bss
    x: RESB 80
    a: RESB 80
    result: RESB 80
SECTION .text
    GLOBAL _start
_start:
    ; Ввод значения переменной x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov [x], eax
    ; Ввод значения переменной a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov [a], eax
    ; Сравнение x и 4
    cmp dword [x], 4
    jl less_than_4
    jge greater_than_or_equal_4
less_than_4:
    ; Вычисление f = x + 4
    mov eax, [x]
    add eax, 4
    mov [result], eax
    jmp end_calculation
greater_than_or_equal_4:
    ; Вычисление f = a * x
    mov eax, [a]
    mov ebx, [x]
    imul eax, ebx
    mov [result], eax
end_calculation:
    ; Вывод результата на экран
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF
    call quit
