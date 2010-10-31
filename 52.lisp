
(defun split (n)
  (multiple-value-bind (n r) (floor n 10)
    (if (= 0 n)
        (cons r nil)
        (cons r (split n)))))

(defun sequalp (list)
  (cond
    ((not (rest list)) t)
    ((equalp (first list) (second list)) (sequalp (rest list)))
    (t nil)))

(loop for x from 1 below 1000000000
     when (sequalp (mapcar (lambda (i) (sort (split (* i x)) #'<))
                           '(1 2 3 4 5 6)))
     return x)