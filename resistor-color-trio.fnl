(fn num-to-zeros [n]
  (var result "")
  (for [_ 1 (tonumber n)]
    (set result (.. result "0")))
  result)

(fn resistor-color-trio [c1 c2 c3]
  (local color-map {:black 0
                    :brown 1
                    :red 2
                    :orange 3
                    :yellow 4
                    :green 5
                    :blue 6
                    :violet 7
                    :grey 8
                    :white 9})
  (local metric-map {0 "ohms" 1 "kiloohms" 2 "megaohms" 3 "gigaohms"})
  (local color1 (. color-map c1))
  (var color2 (. color-map c2))
  (var zeros-count (. color-map c3))
  (when (= c2 "black")
    (set zeros-count (+ zeros-count 1))
    (set color2 ""))
  (local zeros-left-count (% zeros-count 3))
  (local metric-num (. metric-map (math.floor (/ zeros-count 3))))
  (local number-str
         (tonumber (.. color1 color2 (num-to-zeros zeros-left-count))))
  (values number-str metric-num))

{:decode resistor-color-trio}
