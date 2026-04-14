(fn [str]
  (local by-index #($1:sub $2 $2))
  (local letters {})
  (for [i 1 (length str)]
    (local letter (str.lower (by-index str i)))
    (when (and (. letters letter) (string.match letter "%w"))
      (lua "return false"))
    (tset letters letter 0))
  true)
