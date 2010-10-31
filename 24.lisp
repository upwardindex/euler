
(defun permutations (list)
  (cond ((= 1 (length list)) list)
        (t (loop for e in list append
                (mapcar (lambda (x) (+ e (* 10 x)))
                        (permutations (remove e list)))))))

(nth 999999 (sort (permutations '(0 1 2 3 4 5 6 7 8 9)) #'<))
