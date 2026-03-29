(fn resistor-color-duo [colors]
  (let [color-maps {:black 0
                    :brown 1
                    :red 2
                    :orange 3
                    :yellow 4
                    :green 5
                    :blue 6
                    :violet 7
                    :grey 8
                    :white 9}
        first (. color-maps (. colors 1))
        second (. color-maps (. colors 2))]
    (tonumber (.. first second))))

{:value resistor-color-duo}
