
(declaim (optimize (debug 0) (safety 0) (space 0) (speed 3)))

(defun pixel-value (x y n)
  (declare ((unsigned-byte 32) x y n))
  (if (<= (+ (expt (- x (expt 2 (- n 1))) 2)
             (expt (- y (expt 2 (- n 1))) 2))
          (expt 2 (- (* 2 n) 2)))
      'black
      'white))

(defun zone-value (x0 y0 radius n)
  "Based on the fact that the image is a black circle we only need to check corners."
  (declare ((unsigned-byte 32) x0 y0 radius) (fixnum n))
  (let* ((r-1 (1- radius))
         (n/2 (expt 2 (1- n)))
         (quadrant2or4 (not (eq (>= x0 n/2) (>= y0 n/2)))))
    (let ((v1 (if quadrant2or4
                  (pixel-value (+ x0 r-1) y0 n)
                  (pixel-value x0 y0 n)) )
          (v2 (if quadrant2or4
                  (pixel-value x0 (+ y0 r-1) n)
                  (pixel-value (+ x0 r-1) (+ y0 r-1) n))))
      (if (eq v1 v2)
          v1
          'gray))))


(defun encode (x0 y0 radius n)
  (declare ((unsigned-byte 25) x0 y0 radius n))
  (let ((zval (if (= radius (ash 1 n))
                  'gray ;hack for the first split
                  (zone-value x0 y0 radius n))))
    (ccase zval
      (black 2)
      (white 2)
      (gray (let ((r/2 (/ radius 2)))
              (declare ((unsigned-byte 25) r/2))
              (1+ (+
                   (encode x0 (+ y0 r/2) r/2 n)
                   (encode (+ x0 r/2) (+ y0 r/2) r/2 n)
                   (encode x0 y0 r/2 n)
                   (encode (+ x0 r/2) y0 r/2 n))))))))


;(encode 0 0 (expt 2 24) 24)