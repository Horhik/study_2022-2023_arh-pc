---
## Front matter
title: " Лабораторная работа №6. Основы работы с Midnight Commander (mc). Структура программы на языке ассемблера NASM."
subtitle: "Дисциплина: Архитектура ЭВИ"
author: "Осокин Георгий Иванович НММбд-02-22"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы
Приобретение практических навыков работы в Midnight Commander. Освоение

# Выполнение лабораторной работы

## Откроем через терминал MidnightCommander

![Открытие Midnight Commander](image/1.png){ #fig:001 width=70% }

Перейдем в каталог `./work/arch-pc` и создадим папку `./lab06`

![Создание папки](image/2.png){ #fig:002 width=70% }

Наберем в строке ввода `touch lab6.asm`

![Создание файла](image/3.png){ #fig:003 width=70% }

## Для своего удобства я изменю текстовый редактор по умолчанию на VIM

Зайдем в настройки, нажав `F9`, `o`, `c`

![Открытие настроек MC](image/4.png){ #fig:004 width=70% }

Нажмем `t` что бы снять галочку с "Use internal edit"

![Изменение конфигурации MC](image/5.png){ #fig:005 width=70% }

Теперь, когда мы нажимаем `F4` в MC, открывается текстовый редактор VIM

![Открытие текстового редактора через MC](image/6.png){ #fig:006 width=70% }

## Введем текст программы из листинга

![ Введенный текст на языке ассемблера ](image/7.png){ #fig:007 width=70% }

Просмотрим содержимое измененного и сохраненного файла через MC, нажав `F3`

![Просмотор содержимого через MC](image/8.png){ #fig:008 width=70% }

Оттранслируем, слинкуем файл `lab6-1.asm` (переместив lab6 в lab6-1).
Запустим исполнимый файл.

![Трансляция линковка и запуск lab6-1.asm](image/9.png){ #fig:009 width=70% }

## Подключим внеший файл

Откроем MC

![Открытие  MC](image/10.png){ #fig:010 width=70% }

Найдем файл `in_out.asm` в `~/Downloads`

![Просмотр папки Downloads](image/11.png){ #fig:011 width=70% }

Скопируем файл в lab5, нажав `F5`

![Копирование через MC](image/12.png){ #fig:012 width=70% }

Как видим, файл появился в директории `lab06`

![Скопированный файл](image/13.png){ #fig:013 width=70% }

Скопируем файл в `lab6-2.asm`

![Копирование в lab6-2.asm](image/14.png){ #fig:014 width=70% }

 Как видим, файл скопировался
 
![Просмотр скопированного файла](image/15.png){ #fig:015 width=70% }

## Изменим содержимое lab6-2.asm, используя подпрограммы из `in_out.asm`

![Отредактированный lab6-2.asm](image/16.png){ #fig:016 width=70% }

Создадим копию lab6-2.1.asm

![Новая копия](image/17.png){ #fig:017 width=70% }

Заменим `sprintLF` на `sprint`

![Замена подпрограммы ](image/18.png){ #fig:018 width=70% }

Странслируем, слинкуем и запустим две эти программы

![Запуск двух программ](image/19.png){ #fig:019 width=70% }

Как видим, у первой есть перенос строки, у второй он отсутствует

# Задания для самостоятельной работы
 
## Создадим копию `lab-1.asm` с выводом ввода

![Создание копии](image/20.png){ #fig:020 width=70% }

Откроем новый файл и добавим в него блок с выводом строки из `buf1`

![Новый блок кода](image/21.png){ #fig:021 width=70% }

Скомпилируем и запустим

![Запуск lab-1](image/22.png){ #fig:022 width=70% }

Заметим, что если заменить `buf1` на `msg+msgLen` то резульат будет таким же.
Так как `buf1` инициализируется в памяти сразу после `msg` и размер `msg` это `msgLen`.
Поэтому, аддрес `msg+msgLen` в точности аддрес `buf1`

![Замена buf на msg+msgLen](image/21.2.png){ #fig:0212 width=70% }

Скомпилируя этот файл мы получим такой же результат

![Запуск программы ](image/23.png){ #fig:023 width=70% }

Отнимем 1 и посмотрим что получится

![Отнятие единицы ](image/24.png){ #fig:024 width=70% }

Исполним

![Исполнение измененной программы](image/25.png){ #fig:025 width=70% }

Мы захватили с собой перенос строки, которым заканчивался текст `msg`

## Создадим копию `lab-2.asm` с выводом ввода

![Создание копии](image/26.png){ #fig:026 width=70% }

Добавим две строчки, первая будет перемещать значение из буфера в  eax
Вторая исполнит подпрограмму вывода

![Добавление новых строчек](image/27.png){ #fig:027 width=70% }

Скомпилируем и запустим 

![Запуск lab-2-copy](image/28.png){ #fig:028 width=70% }



# Выводы

В ходе данной лабораторной работы мы научились пользоваться Midnight Commander и освоили базовые инструкции языка ассемблера mov и int. 

# Список литературы{.unnumbered}

