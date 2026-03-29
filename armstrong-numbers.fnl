(fn split [str-or-num]
  (icollect [_ ch (utf8.codes str-or-num)]
    (utf8.char ch)))

(fn is-armstrong-number [number]
  (= number (accumulate [sum 0 _ n (ipairs (split number))]
              (+ sum (^ (tonumber n) (length (tostring number)))))))

{:is_armstrong_number is-armstrong-number}
