
(defun split (n)
  (multiple-value-bind (f r) (floor n 10)
    (if (= 0 f)
        (cons r nil)
        (cons r (split f)))))

(defun ss (n)
  (apply #'+ (mapcar (lambda (x) (* x x)) (split n))))


(defun 89? (n)
  (case n
    (89 t)
    (1 nil)
    (otherwise (89? (ss n)))))

