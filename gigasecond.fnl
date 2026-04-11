(fn anniversary [date]
  (local gigasecond 1000000000)
  (os.date "%x" (+ date gigasecond)))

{:anniversary anniversary}
