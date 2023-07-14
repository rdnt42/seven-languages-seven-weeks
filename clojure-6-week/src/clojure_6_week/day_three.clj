(ns clojure-6-week.day-three)
(:refer-clojure :exclude [get])

; START:create
(defn create
  []
  (atom {}))
; END:create

; START:get
(defn get
  [cache key]
  (@cache key))
; END:get

; START:put
(defn put
  ([cache value-map]
   (swap! cache merge value-map))
  ([cache key value]
   (swap! cache assoc key value)))
; END:put
; START:usage
(def ac (create))
(put ac :quote "I'm your father, Luke.")
(println (str "Cached item: " (get ac :quote)))
; END:usage

;1
(defn create
  []
  (atom 0))

(defn debit
  [account add-sum]
  (swap! account - add-sum))

(defn credit
  [account add-sum]
  (swap! account + add-sum))

(def account (create))
(println @account)
(credit account 5)
(println @account)
(debit account 1)
(debit account 2)
(println @account)

;2
(def totalCount (atom 0))
(def queue (atom 0))

(defn takeClient []
  (if (< @queue 3)
    (do
      (swap! queue inc)
      (swap! totalCount inc))))

(defn freeClient []
  (if (> @queue 0)
    (
      do (swap! queue dec))))
(future (loop []
          (takeClient)
          (Thread/sleep (rand-int 21) (+ 10 30))
          (recur)))
(future (loop []
          (freeClient)
          (Thread/sleep 20)
          (recur)))

(future (loop []
          (Thread/sleep 10000)
          (println totalCount)
          (recur)))


