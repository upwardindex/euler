
(defun ! (n)
  (if (= 0 n)
      1
      (* n (! (1- n)))))

(defun c (n r)
  (/ (! n) (* (! r) (! (- n r)))))

(loop for n from 1 to 100 sum
     (loop for r from 1 to n
          when (> (c n r) 100000) sum 1))