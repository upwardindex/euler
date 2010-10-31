(+ (* 99 9 3) ;the number of letters in the missing "and"s
   (loop for ch across (apply #'concatenate
                              'string
                              (loop for i from 1 to 1000
                                 collect (format nil "~r " i)))
      when (alpha-char-p ch)
      sum 1))