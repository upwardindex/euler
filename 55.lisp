
(defun split (n)
  (multiple-value-bind (n r) (floor n 10)
    (if (= 0 n)
        (cons r nil)
        (cons r (split n)))))

(defun palin? (n)
  (equalp (split n) (reverse (split n))))

(defun unsplit (list)
  (loop for x in list
       for i from 0
       sum (* (expt 10 i) x)))

(defun revadd (n)
  (+ n (unsplit (reverse (split n)))))

(defun lychel? (n)
  (loop for i from 1 to 50
       for ra = (revadd n) then (revadd ra)
       when (palin? ra) return nil
       finally (return t)))

(loop for n from 1 below 10000
     when (lychel? n) sum 1)