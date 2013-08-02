is_prime :: Int -> Bool
is_prime n
	| n < 2 		= False
	| n == 2 		= True
	| (n `mod` 2) == 0 	= False
	| otherwise 		= all (( /=0 ).(mod n)) (takeWhile (\x -> x*x <= n) [3,5..])

