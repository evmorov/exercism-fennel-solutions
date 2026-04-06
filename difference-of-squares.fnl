(fn sum [list]
  (accumulate [total 0 _ i (ipairs list)]
    (+ total i)))

(fn range [num]
  (fcollect [n 1 num] n))

(fn map [list f]
  (icollect [_ num (ipairs list)]
    (f num)))

(fn square [n]
  (^ n 2))

(fn square-of-sum [num]
  (square (sum (range num))))

(fn sum-of-squares [num]
  (sum (map (range num) #(square $1))))

(fn difference-of-squares [num]
  (- (square-of-sum num) (sum-of-squares num)))

{:square_of_sum square-of-sum
 :sum_of_squares sum-of-squares
 :difference_of_squares difference-of-squares}
