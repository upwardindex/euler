(defun rotations (n)
  (let ((str (format nil "~d~d" n n))
        (log10 (log n 10)))
    (loop for i below log10
         collect (parse-integer str :start i :end (ceiling (+ i log10))))))

(defun primep (n)
  (loop for i from 2 to (sqrt n)
       when (= 0 (mod n i))
       return nil
       finally (return t)))

(defun andlist (list)
  (cond ((not list) t)
        (t (if (first list) (andfun (rest list)) nil))))


(loop for i from 2 below 1000000
     when (and
           (primep i)
           (andlist (mapcar #'primep (rotations i))))
     sum 1)

