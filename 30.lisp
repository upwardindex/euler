
(defun sum-of-pow-digits (n pow)
  (cond ((= 0 n) 0)
        (t (let ((mod10 (mod n 10)))
             (+ (expt mod10 pow) (sum-of-pow-digits (/ (- n mod10) 10) pow))))))

(loop for i from 2 to 1000000
   when (= i (sum-of-pow-digits i 5))
   sum i)

