
(length
 (remove-duplicates
  (loop for a from 2 to 100 nconc
       (loop for b from 2 to 100 collect
            (expt a b)))))