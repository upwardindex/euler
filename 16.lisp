(loop for i = (expt 2 1000) then (/ (- i mod10) 10)
     for mod10 = (mod i 10)
     while (/= 0 i)
     sum mod10)