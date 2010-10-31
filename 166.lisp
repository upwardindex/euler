


(defun row-sum (array n)
  (loop for x from 0 to 3
       sum (aref array n x)))

(defun col-sum (array n)
  (loop for y from 0 to 3
       sum (aref array y n)))

(defun d-dia-sum (array)
  (loop for i from 0 to 3
       sum (aref array i i)))

(defun a-dia-sum (array)
  (loop for i from 0 to 3
       sum (aref array i (- 3 i))))

(defmacro loop-n (n-list array &body body)
  (cond ((not n-list) `(progn ,@body))
        (t (let ((i-name (gensym)))
             (multiple-value-bind (y x) (floor (first n-list) 4)
               `(loop for ,i-name from 0 to 9
                   do (setf (aref ,array ,y ,x) ,i-name) sum
                     (loop-n ,(rest n-list) ,array ,@body)))))))

(defun count-poss ()
  (let ((array (make-array '(4 4) :initial-element 0)))
    (loop-n (0 1 2 3) array
       (let ((val (row-sum array 0)))
         (loop-n (4 5 6 7) array
            (if (/= val (row-sum array 1))
                0
                (loop-n (8 9 10 11) array
                   (if (/= val (row-sum array 2))
                       0
                       (loop-n (12) array
                          (if (/= val (col-sum array 0))
                              0
                              (loop-n (13) array
                                 (if (/= val (col-sum array 1))
                                     0
                                     (loop-n (14) array
                                        (if (/= val (col-sum array 2))
                                            0
                                            (loop-n (15) array
                                               (if (= val
                                                      (col-sum array 3)
                                                      (row-sum array 3)
                                                      (a-dia-sum array)
                                                      (d-dia-sum array))
                                                   (progn (format t "~a->~a~%" array val) 1)
                                                   0))))))))))))))))

(defparameter tableau-test (make-array '(4 4) :initial-contents '((0 1 2 3)
                                                                  (4 5 6 7)
                                                                  (8 9 10 11)
                                                                  (12 13 14 15))))

(defun sub-sums (i n sums)
)

(defmacro aa (i)
  (multiple-value-bind (y x) (floor i)
    `(aref array ,y ,x)))

(defun count-configs (val)
  (let ((array (make-array '(4 4) :initial-element 0)))
    (loop-n (0 5 10 3 13 9 8) array
       (progn (setf (aa 15) (- val (aa 0) (aa 5) (aa 10))
                    (aa ))))))

(* 2 (apply #'+ (mapcar #'count-configs (loop for i from 0 to 18 collect i))))



;; This is too slow! need a new strat