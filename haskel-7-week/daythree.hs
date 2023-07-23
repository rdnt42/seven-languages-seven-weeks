import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HashMap
-- chat gpt

hasValue :: (Eq k, Hashable k) => k -> HashMap k v -> Maybe v
hasValue key hashMap = HashMap.lookup key hashMap

main :: IO ()
main = do
    let hashMap = HashMap.fromList [("apple", 5), ("banana", 3), ("orange", 2)]
    let key = "banana"
    let result = hasValue key hashMap
    case result of
        Just value -> putStrLn $ "key: " ++ key ++ ", value: " ++ show value
        Nothing    -> putStrLn $ "key " ++ key ++ " doesn't exists"
