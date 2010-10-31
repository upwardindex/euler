(defun square (i)
  (* i i))

(- (square (loop for i from 1 to 100 sum i))
   (loop for i from 1 to 100 sum (square i)))