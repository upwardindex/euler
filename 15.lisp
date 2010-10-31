

(defun count-choices (n1 n2)
  (cond ((= 0 n1 n2) 1)
        (t (+ (if (> n1 0) (count-choices (1- n1) n2) 0)
              (if (> n2 0) (count-choices n1 (1- n2)) 0)))))

(loop for i from 0 to 10
   for cc-1 = 1 then cc
   for cc = (count-choices i i)
   do (format t "~a -> ~a (~a)~%" i cc (/ cc (* 4 cc-1))))

(apply #'*
       (expt 4 20)
       (loop for n from 1 to 20
          collect (/ (1- (* 2 n))
                     (* 2 n))))