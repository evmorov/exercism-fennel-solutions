(fn egg-count [number]
  (local odd? #(> (% $ 2) 0))
  (var n number)
  (var eggs 0)
  (while (> n 0)
    (when (odd? n) (set eggs (+ eggs 1)))
    (set n (math.floor (/ n 2))))
  eggs)

{:egg_count egg-count}
