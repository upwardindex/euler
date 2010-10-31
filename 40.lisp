
(defun digit (n i)
  (let ((ri (- (floor (log n 10)) i)))
    (floor (mod n (expt 10 (1+ ri))) (expt 10 ri))))

(defun digit-from-position (pos)
  (let* ((p (1- pos))
         (c-digits (loop for c-digits from 1
                      for count = (* c-digits
                                     (- (expt 10 c-digits)
                                        (expt 10 (1- c-digits))))
                      when (< p count) return c-digits
                      do (decf p count))))
    (digit (+ (expt 10 (1- c-digits))
              (floor p c-digits))
           (mod p c-digits))))

(time (apply #'* (mapcar #'digit-from-position (list 1 10 100 1000 10000 100000 1000000))))
