import Sorting

main :: IO ()
main = do
    testMergesort
    testMergesortPar
    testQuicksort
    testQuicksortPar

testValues = [ ([] :: [Int])
    , [1]
    , [3, 2] 
    , [2, 1, 3] 
    , [4, 1 , 3, 2] 
    , [10, 5, 2, 5, 6, 2, 1, 8, 9, 3]
    ]

testSplit :: IO ()
testSplit = do
    print $ split ([] :: [Int])
    print $ split [5]
    print $ split [5, 10]
    print $ split [10, 5, 2]
    print $ split [10, 5, 2, 5, 6, 2, 1, 8, 9, 3]

testMerge :: IO ()
testMerge = do
    print $ merge ([] :: [Int]) ([] :: [Int])
    print $ merge [1] ([] :: [Int])
    print $ merge ([] :: [Int]) [2]
    print $ merge [4] [5]
    print $ merge [1, 2, 3] [4, 5, 6]
    print $ merge [1, 3, 5] [2, 4, 6]
    print $ merge [1, 2, 2, 3, 4] [2]

testMergesort :: IO ()
testMergesort = mapM_ (print . mergesort) testValues

testQuicksort :: IO ()
testQuicksort = mapM_ (print . quicksort) testValues

testQuicksortPar :: IO ()
testQuicksortPar = mapM_ (print . quicksortPar) testValues

testMergesortPar :: IO ()
testMergesortPar = mapM_ (print . mergesortPar) testValues
