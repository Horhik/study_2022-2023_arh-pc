; input output string program

%include '../in_out.asm'              ; including external file

; --- Variable declaration --- ;

SECTION .data                      ;initializing data section
msg:    DB 'Введите строку:', 10   ; message + \n

SECTION .bss                       ; no initialized data section
buf1:   RESB 80                    ; 80 bytes size buff

; --- Programm text --- ;

SECTION .text                      ; Code itsel
GLOBAL _start                      ; Beginning of the programm
  _start:                          ; entry point

; --- `write` syscall --- ;
; printing string from 'msg' with len 'msgLen'

  mov   eax, msg                     ; moving 'msg' addres to eax
  call  sprintLF                     ; call subrogramm for printing 

  mov ecx, buf1                      ; moving 'buf1' addres to ecx
  mov edx, 80                        ; mov string len to edx
  call sread                         ; call subprogramm for output


  call quit                         ; call subprogram for quit

