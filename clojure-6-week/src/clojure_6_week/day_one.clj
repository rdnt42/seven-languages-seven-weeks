(ns clojure-6-week.day-one
  (:import (clojure.lang Keyword PersistentArrayMap PersistentList)))

(defn hello-world []
  (println "Hello World"))

;1
(defn big [st, n]
  (println (> (count st) n)))
(hello-world)
(big "12345" 7)
(big "12345" 2)

;2
(defn collection-type [col]
  ;(println (class col) )
  (cond
    (= (class col) PersistentList) (println ":list")
    (= (class col) PersistentArrayMap) (println ":map")
    (= (class col) Keyword) (println ":vector")
    :else (println "unknown")
    )
  )

(hello-world)
(big "12345" 7)
(big "12345" 2)
(collection-type (list 1 2 3))
(collection-type (:one :two :three))
(collection-type {:darth-vader "obi wan", :luke "yoda"})
