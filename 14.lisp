(defun chain-length (n)
  "This exhaust stack too fast"
  (cond ((= 1 n) 1)
        ((evenp n) (+ 1 (chain-length (/ n 2))))
        (t (+ 1 (chain-length (1+ (* 3 n)))))))

(defun iterative-chain-length (n)
  (loop for l from 1
     for c = n then (if (evenp c) (/ c 2) (1+ (* 3 c)))
     when (= c 1) return l))

(let ((bcl 0)
      (bsn 0))
  (loop for sn from 1 below 1000000
     for cl = (iterative-chain-length sn)
       when (> cl bcl)
       do (setf bcl cl
                bsn sn))
  bsn)