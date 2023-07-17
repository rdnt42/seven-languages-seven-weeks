quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted

main :: IO ()
main = do
  let unsortedList = [4, 2, 9, 5, 1, 8, 3]
  let sortedList = quicksort unsortedList
  putStrLn $ "Sorted list: " ++ show sortedList