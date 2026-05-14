(fn random-birthdates [count]
  (local from (os.time {:year 1977 :month 1 :day 1}))
  (local to (os.time {:year 1979 :month 1 :day 1}))
  (local random-birthday #(os.date "%Y-%m-%d" (math.random from to)))
  (faccumulate [birthdays [] _ 1 count]
    (do
      (table.insert birthdays (random-birthday))
      birthdays)))

(fn shared-birthday [birthdates]
  (var shared false)
  (let [bdays {}]
    (each [_ birthday (ipairs birthdates) &until shared]
      (let [b (birthday:sub 6 12)]
        (when (. bdays b)
          (set shared true))
        (tset bdays b true))))
  shared)

(fn estimated-probability-of-shared-birthday [group-size]
  (* 100 (- 1 (faccumulate [prob 1 size 0 (- group-size 1)]
                (* prob (/ (- 365 size) 365))))))

{:shared_birthday shared-birthday
 :random_birthdates random-birthdates
 :estimated_probability_of_shared_birthday estimated-probability-of-shared-birthday}
