(ns clojure-6-week.day-two)

;1
(defmacro unless [test & body]
  `(if (not ~test)
     (do ~@body)
     (do (println "default"))))

(unless true (println "No more danger, Will."))
(unless false (println "Now, THIS is The FORCE."))