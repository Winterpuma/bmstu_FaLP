(defvar *list*)
(setf *list* '(1 2 3 4 5))

(car (cdr *list*)) ; second
(car (cdr (cdr *list*))) ; third
(car (cdr (cdr (cdr *list*)))) ; fourth
