
(defparameter thedigits '(0 1 2 3 4 5 6 7 8 9))

(defun unsplit (list)
  (loop for x in (reverse list)
       for i from 0
       sum (* (expt 10 i) x)))

(defun loop-call (list fun &optional (created '()))
  (if list
      (loop for elem in list
           sum (loop-call (remove elem list) fun (cons elem created)))
      (funcall fun created)))

(defun div-by (n div)
  (multiple-value-bind (n r) (floor n div)
    (declare (ignore n))
    (= 0 r)))

(defun prop (list)
  (if (and
       (div-by (unsplit (subseq list 1 4)) 2)
       (div-by (unsplit (subseq list 2 5)) 3)
       (div-by (unsplit (subseq list 3 6)) 5)
       (div-by (unsplit (subseq list 4 7)) 7)
       (div-by (unsplit (subseq list 5 8)) 11)
       (div-by (unsplit (subseq list 6 9)) 13)
       (div-by (unsplit (subseq list 7 10)) 17))
      (unsplit list)
      0))

(loop-call thedigits #'prop)