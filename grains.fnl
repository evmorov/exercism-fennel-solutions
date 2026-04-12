(fn square [n]
  (^ 2 (- n 1)))

(fn total []
  (square 65))

{:square square :total total}
