fibonacci' :: (Int a) => a -> a
fibonacci' x
    | x < 0 = "error int"
    | x <= 1 = 1
    | otherwise = fibonacci (x-1) + fibonacci (x-2)
