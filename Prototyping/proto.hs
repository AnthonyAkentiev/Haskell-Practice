-- See: http://fprog.ru/2009/issue2/serguey-zefirov-vladislav-balin-prototyping-with-functional-languages/

-- This function is a prototype of summator device
--input: [0,1,1,3,1,0,0,0,0,0,1]
--output:[0,0,1,2,5,6,6,6,6,6,6,7,7,7,7,7]

summator :: [Integer]->[Integer]
summator input = tmp
	where tmp = 0 : zipWith (+) input tmp 

---------------------------------------------
summatorRecursive :: [Integer] -> Integer -> [Integer]
summatorRecursive [] n = []
summatorRecursive (x:xs) n = tmp 
	where tmp = (x + n):(summatorRecursive xs x)

sumRec :: [Integer] -> [Integer]
sumRec lst = 0:(summatorRecursive lst 0)

-- Test: input [1,2,3,4]
-- 0:(0+1)
-- 0:1:(1+2)
-- 0:1:3:(3+3)
-- 0:1:3:6:(6+4)



