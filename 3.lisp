(defun r-factors (n)
  (loop for i from 2 below (sqrt n)
       when (= 0 (mod n i)) return (cons i (r-factors (/ n i)))
       finally (return (list n))))

(first (sort (r-factors 600851475143) #'>))