(defun divisors (n)
  (remove-duplicates
   (let ((first-half (list 1))
         (second-half (list )))
     (loop for i from 2 below (sqrt (1+ n))
        when (= 0 (mod n i))
        do (setf first-half (cons i first-half)
                 second-half (cons (/ n i) second-half)))
     (append (reverse first-half) second-half))))

(loop for i from 1 below 10000
     for j = (apply #'+ (divisors i))
     when (and (/= i j)
               (= i (apply #'+ (divisors j))))
     sum i)
