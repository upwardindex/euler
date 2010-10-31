(loop for i-2 = 1 then i-1
          for i-1 = 1 then j
          for j = (+ i-1 i-2)
            for n from 3
          when (> j (expt 10 999)) return n)


