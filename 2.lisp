(loop 
   for pp = 1 then p
   for p = 1 then i
   for i = 1 then (+ p pp)
   do (format t "~d " i)
   do (if (evenp i) (format t "<--~%") (format t "~%"))
   when (> i 4000000) return s
   when (evenp i) sum i into s)