import Sorting

main :: IO ()
main = do
    testSplit
    testMerge
    testMergesort

testSplit :: IO ()
testSplit = do
    print $ split ([] :: [Int])
    print $ split [5]
    print $ split [5, 10]
    print $ split [10, 5, 2]
    print $ split [10, 5, 2, 5, 6, 2, 1, 8, 9, 3]

testMerge :: IO()
testMerge = do
    print $ merge ([] :: [Int]) ([] :: [Int])
    print $ merge [1] ([] :: [Int])
    print $ merge ([] :: [Int]) [2]
    print $ merge [4] [5]
    print $ merge [1, 2, 3] [4, 5, 6]
    print $ merge [1, 3, 5] [2, 4, 6]
    print $ merge [1, 2, 2, 3, 4] [2]

testMergesort :: IO()
testMergesort = do
    print $ mergesort ([] :: [Int])
    print $ mergesort [1]
    print $ mergesort [3, 2]
    print $ mergesort [2, 1, 3]
    print $ mergesort [4, 1, 3, 2]
    print $ mergesort [10, 5, 2, 5, 6, 2, 1, 8, 9, 3]
