; lab5.asm

SECTION .data ; Начало секции данных
	string: DB 'Осокин Георгий',10 ; 'Осокин Георгий' плюс
				    ; символ перевода строки

	stringLen: EQU $-string       ; Длина строки string

SECTION .text                       ; Начало секции кода
	GLOBAL _start

_start:       ; Точка входа в программу
	mov eax,4                   ; Системный вызов для записи (sys_write)
	mov ebx,1                   ; Описатель файла '1' - стандартный вывод
	mov ecx,string               ; Адрес строки string в ecx
	mov edx,stringLen            ; Размер строки string
	int 80h                     ; Вызов ядра

	mov eax,1                   ; Системный вызов для выхода (sys_exit)
	mov ebx,0                   ; Выход с кодом возврата '0' (без ошибок)
	int 80h                     ; Вызов ядра
