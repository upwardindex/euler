(defun palindromep (n)
  (let ((decimal (format nil "~d" n)))
    (equal decimal (reverse decimal))))

(defun bigmultfirst (n1 n2)
  (let ((candidates (list (list n1 n2 (* n1 n2)))))
    (loop while (not (palindromep (third (first candidates))))
         do (setf candidates
                  (remove-duplicates
                   (merge 'list (rest candidates)
                          (let ((n1 (first (first candidates)))
                                (n2 (second (first candidates))))
                            (list (list n1 (1- n2) (* n1 (1- n2)))
                                  (list (1- n1) n2 (* (1- n1) n2))))
                          #'> :key #'third)
                   :test #'equal)))
    (third (first candidates))))

(bigmultfirst 999 999)