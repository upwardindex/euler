
(defun gen-fractions ()
  (loop for d from 1 to 8 nconc
       (loop for n from 1 to d collect
            (/ n d))))

