
(defun num-digits (n)
  (ceiling (log n 10)))

(defun split (n)
  (multiple-value-bind (f r) (floor n 10)
    (if (= 0 f)
        (cons r nil)
        (cons r (split f)))))

(defun unsplit (list)
  (loop for x in list
       for i from 0
       sum (* x (expt 10 i))))

(defun rev? (n)
  (every #'oddp (split (+ n (unsplit (nreverse (split n)))))))


(defun how-many-below (n)
  (loop for i below n
       when (/= 0 (mod i 10))
       sum (if (rev? i) 1 0)))


;; TOO SLOW