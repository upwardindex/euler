
(denominator
 (apply #'*
        (loop for denum from 11 to 99 nconc
             (loop for num from 10 below denum
                for fraction = (/ num denum)
                for n0 = (mod num 10)
                for d0 = (mod denum 10)
                for n1 = (/ (- num n0) 10)
                for d1 = (/ (- denum d0) 10)
                when (and (/= 0 (* n0 n1 d0 d1))
                          (/= n0 n1)
                          (or (and (= fraction (/ n0 d1))
                                   (= n1 d0))
                              (and (= fraction (/ n1 d0))
                                   (= n0 d1))))
                collect fraction))))