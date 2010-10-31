
(defun fl (n)
  (1- (ceiling n)))

(defun ce (n)
  (1+ (floor n)))


(defun f2 (n)
  (loop for d from 1 to n sum
       (loop for n from (ce (/ d 3)) to (fl (/ d 2))
          when (= (numerator (/ n d)) n)
          sum 1)))

(f2 12000)