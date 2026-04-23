(fn rotate [str num]
  (local upcase-start 65)
  (local upcase-end 90)
  (local locase-start 97)
  (local locase-end 122)
  (local is-upcase #(and (>= $ upcase-start) (<= $ upcase-end)))
  (local is-locase #(and (>= $ locase-start) (<= $ locase-end)))
  (local is-letter #(or (is-locase $) (is-upcase $)))
  (local alphabet-length (+ (- upcase-end upcase-start) 1))
  (var result "")
  (each [_ code (utf8.codes str)]
    (var result-code code)
    (if (is-letter code)
        (do
          (var base locase-start)
          (if (is-upcase code) (set base upcase-start))
          (local code-no-base (% code base))
          (local new-code-no-base (% (+ code-no-base num) alphabet-length))
          (set result-code (+ base new-code-no-base))))
    (set result (.. result (utf8.char result-code))))
  result)

{:rotate rotate}
