module Sorting
    ( quicksort
    , mergesort
    , split
    , merge
    ) where

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort less) ++ [p] ++ (quicksort more)
    where
        less = filter (< p) xs
        more = filter (>= p) xs

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = let (a, b) = split xs in 
    merge (mergesort a) (mergesort b)

split :: [a] -> ([a], [a])
split [] = ([], [])
split [x] = ([x], [])
split (x:y:xs) = let (a, b) = split xs in (x:a, y:b)

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] xs = xs
merge (x:xs) (y:ys)
    | x <= y    = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)
