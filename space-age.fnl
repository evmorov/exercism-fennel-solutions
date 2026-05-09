(fn new [_ seconds]
  (local round #(tonumber (string.format "%.2f" $)))
  (local earth-age #(round (/ seconds 365.25 24 60 60 (or $ 1))))
  (local space-age {:on_earth #(earth-age)
                    :on_mercury #(earth-age 0.2408467)
                    :on_venus #(earth-age 0.61519726)
                    :on_mars #(earth-age 1.8808158)
                    :on_jupiter #(earth-age 11.862615)
                    :on_saturn #(earth-age 29.447498)
                    :on_uranus #(earth-age 84.016846)
                    :on_neptune #(earth-age 164.79132)})
  (setmetatable space-age {:__index #(error "not a planet" 0)}))

{: new}
