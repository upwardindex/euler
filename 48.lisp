(loop for i from 1 to 1000
     sum (expt i i) into s
     finally (return (mod s (expt 10 10))))