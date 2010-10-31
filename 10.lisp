(defun primep (n)
  (loop for i from 2 below (sqrt (1+ n))
       when (= 0 (mod n i)) return nil
       finally (return t)))

(loop 
     for n from 2 below 2000000
     when (primep n) sum n)