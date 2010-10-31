(defparameter denoms (list 200 100 50 20 10 5 2 1))

(defun count-possibilities (n values)
  (loop for vals = values then (rest vals)
       for val = (first vals)
       while vals
       when (= n val) sum 1
       when (< n val) sum 0
       when (> n val) sum (count-possibilities (- n val) vals)))

(count-possibilities 200 denoms)