# Лабораторная работа №1

**1.  Представить следующие списки в виде списочные ячеек:**  
' (open close halph)	  
' ((TOOL) (call))   
' ((open1) (close2) (halph3))	  
' (TOOL1)-(call2)) ((sell)))   
' ((one) for all (and(me(for you))))	  
' ((TOOL) (call)) ((sell)))   

**2. Используя только функции CAR и CDR, написать выражения, возвращающие**  
a) второй  
b) третий  
c) четвертый элементы заданного списка.  

**3. Что будет в результате вычисления выражений?**

a) (CAADR ' ((blue cube) (red pyramid)))	c) (CADR ' ((abc) (def) (ghi)))  
b) (CDAR '((abc) (def) (ghi)))	d) (CADDR ' ((abc) (def) (ghi)))  

**4. Напишите результат вычисления выражений:**

(list 'Fred 'and 'Wilma)	(cons 'Fred '(and Wilma))  
(list 'Fred ' (and Wilma))	(cons 'Fred '(Wilma))  
(cons Nil Nil)	(list Nil Nil)  
(cons T Nil)	(list T Nil)  
(cons Nil T)	(list Nil T)  
(list Nil)	(cons T (list Nil))  
(cons ' (T) Nil)	(list '(T) Nil)  
(list ' (one two) ' (free temp))	(cons '(one two) '(free temp))  

**5.
Написать функцию** (f arl ar2 ar3 ar4), возвращающую список: ((arl ar2) (ar3 ar4)).  
Написать функцию (f arl ar2), возвращающую ((arl) (ar2)).  
Написать функцию (f arl), возвращающую       (((arl))).  
Представить результаты в виде списочных ячеек.  
