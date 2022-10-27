---
## Front matter
title: "Лабоаторная работа №4. Язык Markdown"
subtitle: "Дисциплина - Архитектура Компьютера"
author: "Осокин Георгий Иванович. НММбд-02-22"

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

	Освоение процедуры оформления лабораторных работ с помощью языка разметки Markdown.

# Выполнение лабораторной работы


## Откроем терминал и перейдем в каталог созданный во время выполнения 3й лабораторной

![Переход в каталог study_2022_2023_arh_pc](image/1.png){#fig:001 width=70%}

## Обновим локальной репозиторий командой `git pull`
![git pull](image/2.png){#fig:002 width=70%}

## Перейдем в каталог с 4 лабораторной 
исполним `make` чтобы выполнить комманды из Makefile

![Вывод комманды make](image/3.png){#fig:003 width=70%}

## Проверим сгенерированные файлы
	Откроем сгенерированные `report.md` и `report.pdf`

![Открытие через zathura и libreoffice](image/4.png){#fig:004 width=70%}

Я отрыл pdf через утилиту **Zathura** и .docx через **LibreOffice**

![Скриншот zathura и libreoffice](image/5.png){#fig:005 width=70%}

## Удалим полученные файлы
исполним комманду `make clean`
Убедимся, что файлы удалены с помощью `ls`

![`Make clean` и `ls`](image/6.png){#fig:006 width=70%}

## Откроем `report.md` с помощью текстового редактора
В моем случае - это текстовый редактор **Emacs**. Изучим структуру файла.
В начале .md файла (межд `---` ) видим множество заголовков с параметрами, в формате **YAML**

![Мета информация в формате Yaml](image/7.png){#fig:007 width=70%}

В ней указывается шрифт, язык документа, заголовок, автор и т.п.
Внесем некоторые изменения и скомпилируем отчет.

![Измененный MD файл](image/8.png){#fig:008 width=70%}


## Скомпилируем отчет 
Исполник комманду `make`.

![make](image/9.png){#fig:009 width=70%}

Откроем сгенерированный  .pdf   файл через  **Zathura**. 

![make](image/10.png){#fig:010 width=70%}

# Загрузим Файлы на GitHub

# Выводы

Здесь кратко описываются итоги проделанной работы.

# Список литературы{.unnumbered}

::: {#refs}
:::
