import Data.List (nubBy)

--1
reverseList [] = []
reverseList(h:t) = reverseList t ++ [h]

--2 chat gpt
-- nubBy - filter duplicates by predicate
-- [(x, y) | x <- list, y <- list, x /= y] - generate unique pairs x-y (without x-x)
-- filter duplicates (x,y) (y,x)
createPairs :: [String] -> [(String, String)]
createPairs list = nubBy comparePairs [(x, y) | x <- list, y <- list, x /= y]
  where
    comparePairs (x1, y1) (x2, y2) = (x1 == y2) && (y1 == x2)

--3
createTable :: [Int] -> [(Int, Int, Int)]
createTable list = [(x, y, x * y) | x <- list, y <- list]

main :: IO ()
main = do
  print(reverseList [1,2,3,4]) --1
  print(createPairs ["black", "white", "blue", "yellow", "red"]) --2
  print(createTable [1, 2, 3, 4, 5, 6, 7, 8, 9]) --3


