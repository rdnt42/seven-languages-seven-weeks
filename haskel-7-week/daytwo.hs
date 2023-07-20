quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted

halfNumber :: Fractional a => a -> a
halfNumber = (/ 2)

addNewline :: String -> String
addNewline = (++ "\n")

main :: IO ()
main = do
  let unsortedList = [4, 2, 9, 5, 1, 8, 3]
  let sortedList = quicksort unsortedList
  putStrLn $ "Sorted list: " ++ show sortedList

  let text = "text"
  putStr text
  putStr text
  putStr (addNewline text)
  putStrLn "Text in new line"

  let num = 98.0 :: Double
  let half = halfNumber num
  putStrLn $ "Half of " ++ show num ++ " is " ++ show half




