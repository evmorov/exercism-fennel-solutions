(fn split [str-or-num]
  (icollect [_ ch (utf8.codes str-or-num)]
    (utf8.char ch)))

(fn compute [a-strand b-strand]
  (assert (= (length a-strand) (length b-strand))
          "strands must be of equal length")
  (local a-list (split a-strand))
  (local b-list (split b-strand))
  (accumulate [distance 0 i a (ipairs a-list)]
    (if (= a (. b-list i))
        distance
        (+ distance 1))))

{:compute compute}
