(apply #'*
       (loop for a from 1 to 1000
          for subloop = (loop for b from a to (- 1000 a)
                           for c = (sqrt (+ (* a a) (* b b)))
                           when (= 1000 (+ a b c)) do (format t "A=~a, B=~a, C=~a~%" a b c)
                           and return (list a b (round c)))
          when subloop return subloop))