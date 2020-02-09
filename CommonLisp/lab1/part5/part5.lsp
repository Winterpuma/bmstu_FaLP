(defun f1 (ar1 ar2 ar3 ar4)
          (list (list ar1 ar2) (list ar3 ar4)))

(f1 1 2 3 4) ; ((1 2) (3 4))

(defun f2 (ar1 ar2)
	  (list (list ar1) (list ar2)))

(f2 1 2) ; ((1) (2))

(defun f3 (ar1)
	  (list (list (list (ar1))))

(f3 1) ; (((1)))