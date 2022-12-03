%include "in_out.asm"

section .data
  msg1 db "Введите x: ",0h
  msg2 db "Введите a: ",0h
  msg_ans db "Ответ: ",0h
section .bss
  a resb 200
  x resb 200
  ans  resb 200
section .text

GLOBAL _start

_start:

;;; --- READ X ---
	;; PRINT msg1
	push eax
	mov eax, msg1
	call sprintLF
	pop eax

	mov ecx, x
	mov edx, 200
	call sread
	mov eax, x
	call atoi
	mov [x], eax 		; max = num1

;	;; PRINT msg1
	push eax
	mov eax, msg2
	call sprintLF
	pop eax;; --- READ A ---

	mov ecx, a
	mov edx, 200
	call sread
	mov eax, a
	call atoi
	mov [a], eax 		; max = num1

;;; Start comparing

.var1:

	xor ecx, ecx
	mov ecx, 1
	cmp ecx, [a]
	je .var2		; if a = 1, jump to var2

	xor eax, eax
	mov eax, [a]
	mul eax			; else, a = a * a

	je .final

.var2:
	xor eax, eax
	mov eax, [x]
	add eax, 10		; a = a + 10

.final:	

	;; PRINT msg1
	push eax
	mov eax, msg_ans
	call sprintLF
	pop eax
	
	call iprintLF

 



call quit			;Выход
