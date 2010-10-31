
(defun is-right (a b c)
  (= (+ (* a a) (* b b)) (* c c)))

(defun num-sols (n)
  (loop for a from 1 to (/ n 4) sum
       (loop for b from 1 to (- n a) sum
            (let ((c (- n a b)))
              (if (is-right a b c) 1 0)))))

(first
 (sort (loop for p from 3 to 1000 collect (cons p (num-sols p)))
       #'> :key #'cdr))