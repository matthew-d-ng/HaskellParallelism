module Sorting
    ( quicksort
    , mergesort
    , split
    , merge
    , quicksortPar
    , mergesortPar
    ) where

import Control.Parallel
import Control.Parallel.Strategies
      

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort less) ++ (p:(quicksort more))
    where
        less = filter (< p) xs
        more = filter (>= p) xs

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = let (a, b) = split xs 
    in merge (mergesort a) (mergesort b)

split :: [a] -> ([a], [a])
split [] = ([], [])
split [x] = ([x], [])
split (x:y:xs) = let (a, b) = split xs 
    in (x:a, y:b)

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] xs = xs
merge (x:xs) (y:ys)
    | x <= y    = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)


quicksortPar :: Ord a => [a] -> [a]
quicksortPar [] = []
quicksortPar (x:xs) = left ++ (x:right) `using` strat
    where
        left = quicksort (filter (< x) xs)
        right = quicksort (filter (>= x) xs)
        strat f = do
            rpar left
            rseq right
            return f

mergesortPar :: Ord a => [a] -> [a]
mergesortPar [] = []
mergesortPar [x] = [x]
mergesortPar xs = merge left right `using` strat
    where
        (a, b) = split xs
        left = mergesort a
        right = mergesort b
        strat f = do
            rpar left
            rseq right
            return f
