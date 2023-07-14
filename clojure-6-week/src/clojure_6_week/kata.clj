(ns clojure-6-week.kata)

(defn getIndex [start end target nums]
  (println (str start " " end " " target))
  (if (> start end)
    -1
    (let [half (atom (quot (+ start end) 2))]
      (let [value (atom (get nums @half))]
        (cond
          (= target @value) @half
          (> target @value) (do
                             (swap! half inc)
                             (getIndex @half end target nums))
          (< target @value) (do
                             (swap! half dec)
                             (getIndex start @half target nums))
          )))))

(defn binarySearch [target nums]
  (getIndex 0 (dec (count nums)) target nums))

(def nums [-1 0 3 5 9 12])
(println (str "expected: 4, result: " (binarySearch 9 nums)))
