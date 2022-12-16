%include 'in_out.asm'
%include 'my-function.asm'

SECTION .data
func db "Функция: f(x) = 5x + 17: ",0
msg db "Результат: ",0
SECTION .text

global _start

_start:
  pop ecx   ; Извлекаем из стека в `ecx` количество
            ; аргументов (первое значение в стеке)
  pop edx   ; Извлекаем из стека в `edx` имя программы
            ; (второе значение в стеке)
  sub ecx,1 ; Уменьшаем `ecx` на 1 (количество
            ; аргументов без названия программы)
  mov esi, 0 ; Используем `esi` для хранения
            ; промежуточных сумм
  mov eax, func

  call sprintLF


next:
  cmp ecx,0h ; проверяем, есть ли еще аргументы
  jz _end ; если аргументов нет выходим из цикла
          ; (переход на метку `_end`)
  pop eax ; иначе извлекаем следующий аргумент из стека
  call atoi ; преобразуем символ в число


  call magic_function

  add esi,eax ; добавляем к промежуточной сумме

  loop next ; переход к обработке следующего аргумента

_end:

  mov eax, msg ; вывод сообщения "Результат: "
  call sprint
  mov eax, esi ; записываем сумму в регистр `eax`
  call iprintLF ; печать результата

  call quit ; завершение программы
