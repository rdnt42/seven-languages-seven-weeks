(ns clojure-6-week.day-two)

;1
(defmacro unless [test & body]
  `(if (not ~test)
     (do ~@body)
     (do (println "default"))))

(unless true (println "No more danger, Will."))
(unless false (println "Now, THIS is The FORCE."))

;2
(defprotocol Duck
  (quack [d])
  )

(defrecord LakeDuck [name] Duck
  (quack [_] (println (str "Lake duck " name " quacked")))
  )

(defrecord ForestDuck [name] Duck
  (quack [_] (println (str "Forest duck " name " quacked")))
  )

(def duck-one (LakeDuck. "Justin"))
(def duck-two (ForestDuck. "Takeshi"))
(quack duck-one)
(quack duck-two)

;3
(defn game []

  (def rnd (rand-int 10))
   (def input -1)
   (println "choose number between 1 and 10")
   (while (not= input rnd)
     (def input (read-line))
     (cond
       (> rnd (Integer/parseInt input)) (println "Your number lower than answer")
       (< rnd (Integer/parseInt input)) (println "Your number greater than answer")
       :else (println "You won!")
       )
     )
  )
(game)