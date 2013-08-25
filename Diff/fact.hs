
fact :: Integer -> Integer 
 
fact 0 = 1
fact x = fact (x-1) * x

-- Poor perf.; no tail recursion; stack overflow!
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- now using lazy list :-)
fib_fast n = fib_fast_int !! n
	where 
	fib_fast_int = 0 : 1 : zipWith (+) fib_fast_int (tail fib_fast_int)

-- zipWith works like that:
--	xList = zipWith (+) [1:2:3][0:1:2] 
--	xList is now [1:3:5]
 
-- [0:1: (zipWith (+) [0:1][1]]
-- [0:1:1:(zipWith (+) [1:1][1])]
-- [0:1:1:2:(zipWith (+) [1:2][2]
-- [0:1:1:2:3:(zipWith (+)[2:3][3]]
-- [0:1:1:2:3:5:(zipWith (+)[3:5][5]]
-- ... 



