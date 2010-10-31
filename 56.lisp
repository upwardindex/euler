(defun sum-digits (n)
  (cond ((zerop n) 0)
        (t (multiple-value-bind (rest digit) (floor n 10)
             (+ digit (sum-digits rest))))))


(loop for a from 1 below 100 maximize
     (loop for b from 1 below 100 maximize
          (sum-digits (expt a b))))