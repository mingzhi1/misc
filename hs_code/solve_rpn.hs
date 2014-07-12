import Data.List

calc :: String -> Float
calc = head . foldl opter [] . words
    where   opter (x:y:ys) "*" = (x * y):ys
            opter (x:y:ys) "+" = (x + y):ys
            opter (x:y:ys) "-" = (y - x):ys
            opter (x:y:ys) "/" = (y / x):ys 
            opter xs str = read str:xs

--todo 
-----------------------------
-- num opter num
-----------------------------