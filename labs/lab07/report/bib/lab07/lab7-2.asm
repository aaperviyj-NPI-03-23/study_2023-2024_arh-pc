%include 'in_out.asm'
SECTION .data
msg1: DB 'Введите B: ',0h
msg2: DB "Наибольшее число: ",0h
A: DD '20'
C: DD '50'
SECTION .bss
max: resb 10
B: resb 10
SECTION .text
GLOBAL _start
_start:
; ---------- Вывод сообщения 'Введите B: '
mov eax, msg1
call sprint
; ---------- Ввод 'B'
mov ecx, B
mov edx, 10
call sread
; ---------- Преобразование 'B' из символа в число
mov eax, B
call atoi
mov [B], eax
; ---------- Записываем 'A' в переменную 'max'
mov ecx, [A]
mov [max], ecx
; ---------- Сравниваем 'A' и 'С' (как символы)
cmp [A], [C] ; Удален лишний 'ecx'
jg check_B
mov [max], [C] ; Удален лишний 'ecx'
check_B:
; ---------- Преобразование 'max(A,C)' из символа в число
mov eax, max
call atoi
mov [max], eax
; ---------- Сравниваем 'max(A,C)' и 'B' (как числа)
cmp [max], [B] ; Удален лишний 'ecx'
jg fin
mov [max], [B] ; Удален лишний 'ecx'
fin:
; ---------- Вывод результата
mov eax, msg2
call sprint
mov eax, [max]
call iprintLF
call quit
