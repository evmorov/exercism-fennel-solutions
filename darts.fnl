(fn score [x y]
  (let [r (math.sqrt (+ (* x x) (* y y)))]
    (if (<= r 1) 10
        (<= r 5) 5
        (<= r 10) 1
        0)))

{:score score}
