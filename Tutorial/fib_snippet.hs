
-- now using lazy list :-)
fib_fast n = fib_fast_int !! n
	where 
	fib_fast_int = 0 : 1 : zipWith (+) fib_fast_int (tail fib_fast_int)

