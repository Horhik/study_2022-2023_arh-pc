;--------------------------------
; Программа вычисления варианта
;--------------------------------
%include 'in_out.asm'

SECTION .data
msg: DB 'Введите № студенческого билета: ',0
rem: DB 'Ваш вариант: ',0 	

SECTION .bss 	
x: 	RESB 80 	

SECTION .text
GLOBAL _start 	
_start:
	mov eax, msg
	call sprintLF

	mov ecx, x 		; адресс  `x` в ecx
	mov edx, 80		; размер буффера в edx
	call sread		; чтение ввода в `x`

	mov eax,x ; вызов подпрограммы преобразования
	call atoi ; ASCII кода в число, `eax=x`

	xor edx,edx		; очищение edx
	mov ebx,20		; 20 в ebx
	div ebx			; делим значение из eax на 20
	inc edx			; увеличиваем остаток от деления на 1

	mov eax,rem		; Запись адресса строки 'Ваш вариант' в eax
	call sprint		; Вызов вывода строки без переноса строки
	mov eax,edx		; перенос вычесленного остатка в eax
	call iprintLF		; Вывод вычесленного остатка с переносом строки

	call quit
