
give_me_two :: Integer 
give_me_two = 2

give_me_first_param :: a -> [Char] -> a
give_me_first_param x y = x 

myRand :: (Num a) => a -> a
myRand 0 = 123
myRand 1 = 9034930
myRand 2 = 9232
myRand _ = -1

double_me :: (Num a) => a -> a
double_me x = 2 * x

-- Recursion
destroyMyComputer 0 = 9
destroyMyComputer x = destroyMyComputer (x-1)

-- fact 1 = 1
-- fact 2 = 1 * 2
-- fact 3 = 1 * 2 * 3
-- fact 4 = 1 * 2 * 3 * 4 
fact 0 = 1 
fact x = fact (x-1) * x

-- Lists

-- [1,2,3] or ["Vova","Putin"] or [double_me,fact,myRand]
give_me_head [] = []
give_me_head (x:xs) = x

give_me_tail :: [a]->[a]
give_me_tail [] = []
give_me_tail (x:xs) = xs

len_of_list :: [a] -> Integer
len_of_list [] = 0
len_of_list (x:xs) = 1 + len_of_list xs

sum_of_list [] = 0
sum_of_list (x:xs) = x + sum_of_list xs

-- Sugar:
last_item [] = []
last_item x = (x) !! ((len_of_list x)-1)

concat_lists x y = x ++ y

max x y | x>y 	= x
max x y | x<=y = y

findMaxItem [] = 0
findMaxItem (x:xs) = Main.max x (findMaxItem xs)

addVal x y = x + y 

increaseMe = addVal 1

-- Fib. 
-- 0 1 1 2 3 5 8 13 21 34 55 89
fib 0 = 0
fib 1 = 1
fib 2 = 0 + 1
fib 3 = 1 + 1
fib 4 = 2 + 1
fib 5 = 3 + 2
fib 6 = 5 + 3
fib x = fib (x-1) + fib (x-2)

-- now using lazy list :-)
fib_fast n = fib_fast_int !! n
	where 
	fib_fast_int = 0 : 1 : zipWith (+) fib_fast_int (tail fib_fast_int)

------------ 
revert_string [] = []
revert_string (x:xs) = revert_string(xs) ++ [x]


-- Types


