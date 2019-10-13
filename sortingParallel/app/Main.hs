module Main where

import System.Random
import Data.Time
import Sorting
import Control.DeepSeq

getRandomList :: Int -> [Int]
getRandomList n = (take n (randomRs(0, 1000000) (mkStdGen 42)))

-- set algorithm here
testSort = mergesortPar

main :: IO ()
main = do
    let values = getRandomList 1000000
    t0 <- values `deepseq` getCurrentTime
    let result = testSort values
    t1 <- result `deepseq` getCurrentTime
    putStr "Time taken: "
    print $ diffUTCTime t1 t0
