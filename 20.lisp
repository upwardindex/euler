(defun factorial (n)
  (apply #'* (loop for i from 1 to n collect i)))


(loop for i = (factorial 100) then (/ (- i mod10) 10)
   for mod10 = (mod i 10)
   while (/= 0 i)
   sum mod10)