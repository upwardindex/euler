(defun remainder (n divisor)
  (nth-value 1 (floor n divisor)))

(defun recurring-cycle-length (divisor)
  (let ((remainders (list 10)))
    (loop for r = (first remainders)
       until (= 0 r)
       do (progn
            (if (<= divisor r)
                (setf r (remainder r divisor)))
            (setf remainders (cons (* 10 r) remainders))
            (let ((pos (position (first remainders) (rest remainders))))
              (if pos (return (+ 1 pos)))))
       finally (return nil))))

(let ((best-d 0)
      (best-length 0))
  (loop for d from 1 below 1000
       for length = (recurring-cycle-length d)
       when (and length (> length best-length))
       do (setf best-d d
                best-length length))
  best-d)