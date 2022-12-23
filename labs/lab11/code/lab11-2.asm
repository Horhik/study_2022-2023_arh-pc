%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0h
msg db 'Как Вас зовут? ', 0h
initial_text db 'Меня зовут: ', 0h

SECTION .bss
;;;  Note that content follows by `initial_text` that allows us not to concatinate string, but just reading farther by initial_text and getting context of the `content`
content resb 512

SECTION .text
global _start
_start:	
;;; PRINT msg 
	mov eax, msg 
	call sprint
;;; TAKING INPUT
	mov ecx, content
	mov edx, 512
	call sread

;;; CREATING FILE 

	mov ebx, filename
	mov ecx, 0777o 		; read and write for all, rwx for owner
	mov eax, 8
	int 80h

;;; OPENING FILE
	mov ecx, 2
	mov ebx, filename
	mov eax, 5
	int 80h

;;; WRITING INTO FILE

	mov esi, eax


;; Counting len of initial_len
	mov eax, initial_text  	; Len of initial_text to eax
	call slen 
	mov edx, eax		; edx = len(initial_text)
;;; Counting len of content
	mov eax, content  	; Len of content to eax
	call slen 
;;; Summing lens
	add edx, eax		; edx = len(initial_text) + len(content)
	add edx, 3		; to get terminate symbol


	mov ecx, initial_text   ; adding text to print
	mov ebx, esi 		; Moving descriptor of file above to EBX
	mov eax, 4
	int 80h

;;;  Quit
	
	mov ebx, esi
	mov eax, 6
	int 80h

	call quit
	
	
