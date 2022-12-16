%include 'in_out.asm'

SECTION .data
msg:
	DB 'Введите x: ',0
result:
	DB '2x+7=',0
SECTION .bss
x: RESB 80
rezs: RESB 80

SECTION .text
GLOBAL _start
_start:

;------------------------------------------
; Основная программа
;------------------------------------------
	mov eax, msg
	call sprint
	mov ecx, x
	mov edx, 80
	call sread
	mov eax,x
	call atoi
	call _calcul ; Вызов подпрограммы _calcul

	mov eax,result
	call sprint
	mov eax,[result]
	call iprintLF
	call quit

;------------------------------------------
; Подпрограмма вычисления
; выражения "2x+7"

_calcul:
;	call _subcalcul
	mov ebx,2
	mul ebx
	add eax,7
	mov [result],eax
	ret
; выход из подпрограммы

;;; --- SUBCALCUAL subprogramm
;;; g(x) = 3x - 1
;_subcalcul:
;	mov ebx, 3 		; ebx = 3
;	mul ebx			; eax = eax*3
;	dec eax			; eax = eax - 1
;
;	ret
	
