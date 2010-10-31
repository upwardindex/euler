
(defun sum-digits-equals (number n)
  (multiple-value-bind (number r) (floor number 10)
    (let ((n (- n r)))
      (cond ((< n 0) nil)
            ((= number 0) (= n 0))
            (t (sum-digits-equals number n))))))

(defun sum-digits (number)
  (multiple-value-bind (number r) (floor number 10)
    (if (= 0 number)
        r
        (+ r (sum-digits number)))))

(defun s (n)
  (loop for x = 23 then (+ x 23)
       while (< x  (expt 10 n))
       when (sum-digits-equals x 23)
       sum 1))

