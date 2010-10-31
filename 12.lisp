(defun divisors (n)
  (remove-duplicates
   (let ((first-half (list 1))
         (second-half (list n)))
     (loop for i from 2 below (sqrt (1+ n))
        when (= 0 (mod n i))
        do (setf first-half (cons i first-half)
                 second-half (cons (/ n i) second-half)))
     (append (reverse first-half) second-half))))

(defun prime-factors (n)
  (loop for i from 2 below (sqrt (1+ n))
       when (= 0 (mod n i)) return (cons i (prime-factors (/ n i)))
       finally (return (list n))))

(defun is-triangular (n)
  (let ((roundroot (round (sqrt (1+ (* 8 n))))))
    (= (1+ (* 8 n)) (* roundroot roundroot))))


(defun num-from-divs (divs)
  (cond ((not divs) 1)
        (t (* (first divs)
              (num-from-divs (remove-if (lambda (x)
                                          (= 0 (mod (first divs) x)))
                                        (rest divs)))))))

(defun number-from-divisors (divisors)
  (let ((seq (sort divisors #'>)))
    (num-from-divs seq)))

;
; INCOMPLETE SOLUTION
;