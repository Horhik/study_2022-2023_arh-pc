; input output string program

; --- Variable declaration --- ;

SECTION .data                      ;initializing data section
msg:    DB 'Введите строку:', 10   ; message + \n
msgLen: EQU $-msg                  ; len of 'msg'

SECTION .bss                       ; no initialized data section
buf1:   RESB 80                    ; 80 bytes size buff

; --- Programm text --- ;

SECTION .text                      ; Code itsel
GLOBAL _start                      ; Beginning of the programm
  _start:                          ; entry point

; --- `write` syscall --- ;
; printing string from 'msg' with len 'msgLen'

  mov eax, 4                       ; Syscal for `sys_write`
  mov ebx, 1                       ; descriptor - std output
  mov ecx, msg                     ; mov addres of 'msg' to 'ecx'
  mov edx, msgLen                  ; mov size of 'msg' to 'edx'
  int 80h                          ; kernel call

; --- `read` syscall  --- ;
mov eax, 3                         ; syscall for `sys_read`
mov ebx, 0                         ; descriptior 0 - std input
mov ecx, buf1                      ; mov buffer addres for input to ecx
mov edx, 80                        ; mov string len to edx
int 80h                            ; kernel call

; --- `write` syscall --- ;
; printing inputed string from 'msg' with len 'msgLen'

  mov eax, 4                       ; Syscal for `sys_write`
  mov ebx, 1                       ; descriptor - std output
  mov ecx, msg+msgLen              ; increasing addres of 'msg' by 'msgLen' 
                                   ; and thus moving to the addres of the 'buf1'
  mov edx, 80                      ; mov size of 'msg' to 'edx'
  int 80h                          ; kernel call


; --- 'exit' syscall ---;

mov eax, 1                         ; syscall for `sys_exit`
mov ebx, 0                         ; move 0 return code to ebx
int 80h                            ; kernel call

