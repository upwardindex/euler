(loop for year from 1901 to 2000 sum
     (loop for month from 1 to 12
        when (= 6 (nth 6 (multiple-value-list
                           (decode-universal-time
                            (encode-universal-time 0 0 12 1 month year)))))
        sum 1))