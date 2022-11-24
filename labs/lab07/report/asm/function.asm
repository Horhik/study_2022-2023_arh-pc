;--------------------------------
; Программа вычисления варианта
;--------------------------------
%include 'in_out.asm'

SECTION .data
msg: DB 'Введите X: ',0
rem: DB 'Ответ: ',0 	

SECTION .bss 	
x: 	RESB 10 	

SECTION .text
GLOBAL _start 	
_start:
	mov eax, msg
	call sprintLF

	mov ecx, x 		; адресс  `x` в ecx
	mov edx, 10		; размер буффера в edx
	call sread		; чтение ввода в `x`

	mov eax,x ; вызов подпрограммы преобразования
	call atoi ; ASCII кода в число, `eax=x`

	add eax, 10		; Прибавим 10 к eax
	mov cx, 3		; 3 в ECX
	mul cx			; Умножим eax на три (ввод + 10)*3
	sub eax, 20
	mov edx, eax
	xor eax, eax

	mov eax,rem		; Запись адресса строки 'Ваш вариант' в eax
	call sprint		; Вызов вывода строки без переноса строки
	mov eax,edx		; перенос вычесленного остатка в eax
	call iprintLF		; Вывод вычесленного остатка с переносом строки

	call quit
