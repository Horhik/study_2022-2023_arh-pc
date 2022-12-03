%include "in_out.asm"

section .data
  msg1 db "Введите a: ",0h
  msg2 db "Введите b: ",0h
  msg3 db "Введите c: ",0h
  ans db "Наименьшее число: ",0h
section .bss
  num1 resb 20
  num2 resb 20
  num3 resb 20
  min  resb 20
section .text

GLOBAL _start

_start:

;;; --- READ NUM1 ---

	mov eax, msg1
	call sprintLF

	mov ecx, num1
	mov edx, 20
	call sread

	mov eax, num1

	call atoi

	mov [min], eax 		; min = num1

	;; push eax
	;; mov eax, [min]
	;; call iprintLF
	;; pop eax
	
	

.comparing2:	
;;; --- READ NUM2 ---


	mov eax, msg2
	call sprintLF

	mov ecx, num2
	mov edx, 20
	call sread

	mov eax, num2

	call atoi


	cmp [min], eax	 	; cmp num1, num2
	jl .comparing3		; if num1<num2 jpm to .comparing


	
	mov [min], eax		; min = eax = num2


;;; --- READ NUM3 ---


.comparing3:	

	;; push eax
	;; mov eax, [min]
	;; call iprintLF
	;; pop eax
	
	mov eax, msg3
	call sprintLF

	mov ecx, num3
	mov edx, 20
	call sread

	;; push eax
	;; mov eax, [min]
	;; call iprintLF
	;; pop eax
	


	
	mov eax, num3

	call atoi


	cmp [min], eax	 	; cmp num2, num3
	jl .final		; if num2<num3 jpm to .comparing
	mov [min], eax		; min = eax = num3



 
.final:	
	mov eax, ans
	call sprintLF

	mov eax, [min]
	call iprintLF


call quit			;Выход
