import System.Random


randomRankN :: Int -> Int -> [Int] -> IO [Int]
randomRankN n m l = do
    r' <- getStdRandom (randomR (0, m))
    let r = fromIntegral r'
    if elem r l
    then
        randomRankN n m l
    else do
        let ll = r:l
        if length ll > n
        then return ll
        else randomRankN n m ll