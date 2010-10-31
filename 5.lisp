(defun predicate (n)
  (loop for i from 11 to 20
       when (/= 0 (mod n i)) return nil
       finally (return t)))

(loop for i from 1
      when (predicate i) return i)

