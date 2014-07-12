quick_sort :: (Ord a) => [a] -> [a]
quick_sort [] = []
quick_sort [x] = [x]
quick_sort (x,lx) = 
	let left_part = quick_sort[a | a <- lx, a <= x]
	    right_part = quick_sort[a | a <- lx, a > x]
	in left_part ++ [x] ++ right_part

