;Из списка получить список только из символов
(defun extract_symb(lst)
    (cond ((null lst) nil)
          ((symbolp (car lst)) (cons (car lst) (extract_symb (cdr lst))))
          (T (extract_symb (cdr lst)))))

(setf a '(34 5 g d hsd 5 po q))

;(print (extract_symb a))


;Многоуровневый символ, получить вернуть первый символ
(defun first_num(lst)
    (cond ((numberp lst) lst)
          ((atom lst) nil)
          (t (or (first_num (car lst)) (first_num (cdr lst))))))

(setf b '(() sfj e p ui (() (r c g (3)))) )

;(print (first_num b))


;Длина списка
(defun my_length(lst)
    (cond ((null lst) 0)
          (t (+ 1 (my_length (cdr lst))))))

;(print (my_length a))


;Список в один уровень
(defun into_one(lst rst)
    (cond ((null lst) rst)
          ((atom lst) (cons lst rst))
          (t (into_one (car lst) (into_one (cdr lst) rst)))))

;(print (into_one b nil))


;Сортировка вставкой
(defun insert_help(x lst)
    (cond ((null lst) (list x))
          ((<= x (car lst)) (cons x lst))
          (t (cons (car lst) (insert_help x (cdr lst)))) ))

(defun sort_help(lst1 lst2)
    (cond ((null lst1) lst2)
          (t (sort_help (cdr lst1) (insert_help (car lst1) lst2))) ))

(defun sort_ins(lst)
    (sort_help lst nil))

;(setf i '(5 3 7 2 8 1 0))
;(print (sort_ins i))


;Сортировка слиянием
;(defun merge(lst1 lst2 res)
;    (cond ((and (null lst1)(null lst2)) res)
;          ((null lst1) (cons lst2 res))
;          ((null lst2) (cons lst1 res))
;          (T (cond ((<= (car lst1)(car lst2)) (merge (cdr lst1) lst2 (cons (car lst1) res)))
;                   (t (merge lst1 (cdr lst2) (cons (car lst2) res))) ))))

;(defun merge(lst1 lst2 res)
;    (cond ((and (null lst1)(null lst2)) res)
;          ((null lst1) (cons res lst2 ))
;          ((null lst2) (cons res lst1 ))
;          (T (cond ((<= (car lst1)(car lst2)) (merge (cdr lst1) lst2 (cons (car lst1) res)))
;                   (t (merge lst1 (cdr lst2) (cons (car lst2) res))) ))))

(setf first '(1 2 3 3 6 7))
(setf second '(1 3 4 4 5 8 9))

;(print (merge first second nil))

(defun lst_rhalf_help(lst n curr)
    (cond ((eq curr n) lst)
          (t (lst_rhalf_help (cdr lst) n (+ curr 1) )) ))

(defun lst_rhalf(lst n)
    (lst_rhalf_help lst n 0))
    

(defun lst_lhalf(lst n)
    (cond ((eq n 0) nil)
          (t (cons (car lst) (lst_lhalf (cdr lst) (- n 1))) ) ))


(setf f '(4 2 6 6 5 1 8 6 2))

;(print (lst_lhalf f 4))
;(print (lst_rhalf f 4))


;(defun merge_sort(lst)
;    (cond ((<= (length lst) 1) lst)
;          (t (merge (merge_sort ) (merge_sort)) )
;      


;N1 (a)
;A и B числовые множества, полученные из двух смешанных (я так понимаю неотсортированных) одноуровневых списков. Найти A\B
;A \ B - числа из A, которые не содержатся в B.
;Решение: Сортируем, далее делаем процедуру, похожую на слияние, только уже с учетом условия.
;Время работы: O(сортировки двух множеств) + O(|A| + |B|)

;Код на python для лучшего понимания
;def difference(A, B):
;    if len(B)==0:
;        return A # return the leftover list
;    if len(A)==0:
;        return B # return the leftover list
;    if A[0] < B[0]:
;        return [A[0]] + difference(A[1:], B)
;    elif A[0] == B[0]:
;        return difference(A[1:], B[1:])  # omit the common element
;    else:
;        return difference(A, B[1:])

;Рекурсивно
(defun diff(a b)
    (cond ((null b) a)
          ((< (car a)(car b)) (cons (car a) (diff (cdr a) b) ))
          ((> (car a)(car b)) (diff a (cdr b)) )
          (t (diff (cdr a) (cdr b))) ))

(defun set_diff(a b)
    (diff2 (sort_ins a) (sort_ins b)))

;Функционалы
(defun diff2(lst1 lst2)
    (remove-if (lambda (x) (member x lst2 :test #'equalp)) lst1)
)



;(setf a '(3 9 8 7 6 5))
;(setf b '(5 9 1 6 2))
;(print (set_diff a b ))



;N1 (b)
;Дан структурированный список (я так понимаю многоуровневый). Реализовать удаление
;из списка атома, списка

;Рекурсивно
;Как я офигел, когда оно заработало)))
(defun lst_remove(lst elem)
    (cond ((null lst) ()) 
          ((equal elem (car lst)) (lst_remove (cdr lst) elem))
          ((listp (car lst)) (cons (lst_remove (car lst) elem) (lst_remove (cdr lst) elem)))    
          (t (cons (car lst) (lst_remove (cdr lst) elem)))))

;Через функционалы...
(defun lst_remove2(lst elem)
    (mapcar (lambda(x) (if (listp x) (lst_remove2 x elem) x)) (remove elem lst :test #'equalp )))

;(setf lst '(3 2 5 (3 4 ((5) (2 7 3)((5 (2 7 3))))) 6 (2 7 3) 7 3))
;(print (lst_remove2 lst  '(2 7 3)))



;N2 (a)
;Реализовать добавление в ассоциативный список (элементы списка представлены в виде (ключ . значение))
;нескольких точечных пар, заданных списком ключей и списком значений.
;Насколько я понял ее конченную формулировку, на вход идет ассоциативный список и еще два (список ключей, список значений).
;В словаре не может быть пар с одинаковыми ключами (Это мы не проверяем)

(defun lists_to_dict(key_lst val_lst)
    (cond ((null key_lst) nil)
          (t (cons (cons (car key_lst) (car val_lst)) (lists_to_dict (cdr key_lst) (cdr val_lst))) ) ))

        
(defun list_append (l1 l2)
  (cond ((null l1) l2)
        (t (cons (car l1) (list_append (cdr l1) l2))) ))

(defun dict_insert(dict key_lst val_lst)
    (list_append dict (lists_to_dict key_lst val_lst)) )
        

;(setf a '((4 . 2) (5 . 6)) )
;(setf b '(2 3 6))
;(setf c '(4 5 6))
;(print (dict_insert a b c))



;N2 (b)
;Дан смешанный структурированный список. Получить по возрастанию список из числовых
;элементов исходного списка, входящих в заданное в виде одноуровнего смешанного списка множество.
;Ну кааак так можно формулировать задания, вот что тут надо делать????

;Гипотеза №1. Получить все числа из многоуровнего списка, отсортировать это дело.
;Гипотеза №2. Нам задается помимо многоуровнего еще и одноуровневый, в котором, содержаться 
;определенные числа. Мы получаем все числа из многоуровнего и результатом будут числа которые содержатся
;как в заданном, так и полученных списках (В отсортированном порядке).

;Алгоритм решения задачи второй гипотезы. Получаем числа из многоуровнего, сортируем эти числа. Сортируем 
;заданный список, находим пересечение этих двух множеств.


(defun intersect(lst1 lst2)
    (cond ((or (null lst1) (null lst2)) nil)
          ((< (car lst1) (car lst2)) (intersect (cdr lst1) lst2))
          ((> (car lst1) (car lst2)) (intersect lst1 (cdr lst2)))
          (t (cons (car lst1) (intersect (cdr lst1) (cdr lst2)))) ))

(defun intersect2(lst1 lst2)
    (remove-if (lambda(x) (member x lst2 :test-not #'eq)) lst1 ) )

;(setf a '(4 2 5 1 6 2))
;(setf b '(5 3 2 6 1))
;
;(print (funcall (lambda(x)(member x b :test-not #'eq)) a))
;
;(print (intersect2 a b))


(defun solution(lst1 lst2)
    (intersect2 (sort_ins (into_one lst1 nil)) (sort_ins lst2)) )


(setf lst '(3 2 5 ( 4 ( ( 7 )(((9 11 18))))) 6 (1 90) 17 13))
(setf lst2 '(2 6 90 17 10 22 7 33))

;(print (solution lst lst2))


;N3 (a)
;Все числовые элементы исходного смешанного одноуровнего списка удвоить, если
;если сумма его первых числовых элементов больше 10, иначе уменьшить на 10

(defun first_n_sum(lst n res)
    (cond ((or (null lst) (< n 1)) res)
          ((and (numberp (car lst)) (> n 0)) (first_n_sum (cdr lst) (- n 1) (+ res (car lst))) )
          (t (first_n_sum (cdr lst) n res)) ))

(defun first_two(lst)
    (first_n_sum lst 2 0))

(setq a '(sd 35 fh iu d w 43 veg 67 fgh 2 4 5))
;(print (first_two a))

(defun double_nums(lst)
    (cond ((null lst) nil)
          ((numberp (car lst)) (cons (* 2 (car lst)) (double_nums (cdr lst))) )
          (t (cons (car lst) (double_nums (cdr lst)))) ))

(defun sub_nums(lst num)
    (cond ((null lst) nil)
          ((numberp (car lst)) (cons (- (car lst) 10) (sub_nums (cdr lst) num)) )
          (t (cons (car lst) (sub_nums (cdr lst) num))) ))


(defun change_nums(lst)
    (cond ((> (first_two lst) 10) (double_nums2 lst)) 
          (t (sub_nums2 lst 10)) ))


;(defun first_n_sum2(lst n)
;    (reduce #'(lambda(res x) (if (and (numberp x)(> n 0)) () 0) ) lst :initial-value 0) )

;(print (first_n_sum2 a 2))

(defun double_nums2(lst)
    (mapcar #'(lambda (x) (if (numberp x) (* x 2) x)) lst))

(defun sub_nums2(lst num)
    (mapcar #'(lambda (x) (if (numberp x) (- x num) x)) lst))


(setf a '(d a t 9 yt 5 12 w))

;(print (change_nums a))

;N3 (b)
;Даны два структурированных смешанных списка. Получить из этих списков
;числовые множества (одноуровневые списки) и найти пересечение этих двух
;множеств.

(defun intersect_mul_lvl(lst1 lst2)
    (intersect (sort_ins (into_one lst1 nil)) (sort_ins (into_one lst2 nil))) )

(setf lst '(3 2 5 ( 4 ( ( 7 )(((9 11 18))))) 6 (1 90) 17 13))
(setf lst2 '(2 (6 90) (((17) ((10 22)) 7)) 33))

;(print (intersect_mul_lvl lst lst2))

;N4 (a)
;Реализовать выделение из ассоциативной таблицы с числовыми ключами элементов,
;стоящих на нечетных позициях и уменьшить все ключи результирующей таблицы
;на количество элементов в ней.


(defun from_odd_pos(lst idx)
    (cond ((null lst) nil)
          ((eq 0 idx) (from_odd_pos (cdr lst) 1))
          (t (cons (car lst) (from_odd_pos (cdr lst) 0))) ))

(defun sub_keys(lst num)
    (cond ((null lst) nil)
          (t (cons  (cons (- (caar lst) num) (cdar lst)) (sub_keys (cdr lst) num))) ))

(defun pick_out(lst)
    (let ( (out (from_odd_pos lst 1)) )
        (sub_keys out (length out)) ))

(defun from_odd_pos2(lst idx)
    (remove nil (mapcar (lambda(x) (if (eq idx 1) (setf idx 0) (setf idx 1))(if (eq idx 1) x ))lst )))

(setf a '( (3 . 5 ) (6 . 7) (1 . 5) (8 . 2) (2 . 90)))
            
;(print (from_odd_pos2 a 0))

;(print (pick_out a))


;N4 (b)
;Дан смешанный структурированный список. Реализовать выделение из списка
;числовых атомов, лежащих в заданном интервале, и символьных атомов в разные списки

;Что-то не совсем понятно о каких интервалах идет речь

(defun lists_from_lst(lst int_num int_symb)
    (let ((lst_one (into_one lst nil)))
         (cons (get_nums lst_one 0 (- (car int_num) 1) (cdr int_num)) (get_symbols lst_one 0 (- (car int_symb) 1) (cdr int_symb))) ))

(defun get_nums(lst curr s e)
    (cond ((null lst) nil)
          ((not (numberp (car lst))) (get_nums (cdr lst) curr s e))
          ((or (< curr s) (>= curr e)) (get_nums (cdr lst) (+ 1 curr) s e))
          (t (cons (car lst) (get_nums (cdr lst) (+ 1 curr) s e))) ))

(defun get_symbols(lst curr s e)
    (cond ((null lst) nil)
          ((not (symbolp (car lst))) (get_symbols (cdr lst) curr s e))
          ((or (< curr s) (>= curr e)) (get_symbols (cdr lst) (+ 1 curr) s e))
          (t (cons (car lst) (get_symbols (cdr lst) (+ 1 curr) s e))) ))


;(setf lst '(3 2 (b fd 5) 5 ( 4 ( ( 7 )(((9 11 bfd a 18 l))))) 6 (1 90) pok 17 lop 13))
;
;(print (lists_from_lst lst '(4 . 7) '(3 . 6)))



;Удаление дубликатов в списке. Сортируем и делаем следующее:
(defun remove_dup(lst prev)
    (cond ((null lst) nil)
          ((eq (car lst) prev) (remove_dup (cdr lst) prev))
          (t (cons (car lst) (remove_dup (cdr lst) (car lst)))) ))

(setf a '(43 50 51 52 55 55 100))
;(print (remove_dup a "inf"))


;Вычисление n!! (Если n - четное, то n!! = 2 * 4 * ... * n, если n - нечетное, то n!! = 1 * 3 * ... * n)
(defun factorial_ii_help(n res)
    (cond ((< n 2) res)
          (t (factorial_ii_help (- n 2) (* n res))) ))

(defun factorial_ii(n)
    (factorial_ii_help n 1))

;(print (factorial_ii 10))

;(print (member-if #'listp '(a b nil nil c d)))


;(print (reduce (lambda (a x) (if (evenp x) (+ a x) a)) '(1 1 1 2 4 6 7 9 11) :initial-value 0))


;(print (reduce #'+ '(4 5 7 89 3)))