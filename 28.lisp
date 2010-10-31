(let ((val 1)
      (sum 1))
  (loop for n from 1 to 500
       for i = (* 2 n)
       do (dotimes (nothing 4)
            (incf val i)
            (incf sum val)))
  sum)