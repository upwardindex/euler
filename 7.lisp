(defun primep (n)
  (loop for i from 2 below (sqrt (1+ n))
       when (= 0 (mod n i)) return nil
       finally (return t)))

(loop 
     for n from 2
     for i = 1 then (if (primep n) (1+ i) i)
     when (= i 10001) return n)