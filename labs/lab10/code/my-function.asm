; f(x) = 17 + 5x
; eax = x
; eax = res
magic_function:

  push ebx
  push ecx
  push edx

  mov ecx,5
  mul ecx
  add eax, 17

  pop edx
  pop ecx
  pop ebx


  ret


