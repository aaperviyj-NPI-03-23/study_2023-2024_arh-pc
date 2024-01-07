%include 'in_out.asm'
SECTION .data
msg1 DB "Наименьшее число: ", 0h
A DD '44'
B DD '74'
C DD '17'
SECTION .bss
min resb 10
SECTION .text
GLOBAL _start
_start:
    ; ---------- Преобразование 'A' из символа в число
    mov eax, A
    call atoi
    mov [A], eax
    ; ---------- Преобразование 'B' из символа в число
    mov eax, B
    call atoi
    mov [B], eax
    ; ---------- Преобразование 'C' из символа в число
    mov eax, C
    call atoi
    mov [C], eax
    ; ---------- Записываем 'A' в переменную 'min'
    mov ecx, [A]
    mov [min], ecx
    ; ---------- Сравниваем 'A' и 'B'
    cmp ecx, [B]
    jl check_C
    ; ---------- Если 'A >= B', то 'min = B'
    mov ecx, [B]
    mov [min], ecx
    jmp check_C
check_C:
    ; ---------- Сравниваем 'min' и 'C'
    cmp ecx, [C]
    jl fin
    ; ---------- Если 'min >= C', то 'min = C'
    mov ecx, [C]
    mov [min], ecx
fin:
    ; ---------- Вывод результата
    mov eax, msg1
    call sprint
    mov eax, [min]
    call iprintLF
    call quit
