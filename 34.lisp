(defun factorial (n)
  (cond ((= 1 n) 1)
        (t (* n (factorial (1- n))))))

(defmacro fact (n)
  (factorial n))

(defun d! (n)
  "Precomputed factorial for digits."
  (ccase n
     (0 1)
     (1 (fact 1))
     (2 (fact 2))
     (3 (fact 3))
     (4 (fact 4))
     (5 (fact 5))
     (6 (fact 6))
     (7 (fact 7))
     (8 (fact 8))
     (9 (fact 9))))

(defun digifact (n)
  (cond ((= 0 n) 0)
        (t (let ((mod10 (mod n 10)))
             (+ (d! mod10) (digifact (/ (- n mod10) 10)))))))


(loop for i from 3 to 10000000
     when (= i (digifact i))
     sum i)

