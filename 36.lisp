(loop for i from 1 below 1000000
     when (let ((b2 (format nil "~2r" i))
                (b10 (format nil "~10r" i)))
            (and (equal b2 (reverse b2))
                 (equal b10 (reverse b10))))
     sum i)