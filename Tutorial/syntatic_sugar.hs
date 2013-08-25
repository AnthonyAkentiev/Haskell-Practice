-- NOW: syntatic sugar
longList = [1,3..50]

type MyEnum = 0 | 1..120

subtractTwoFromList lst = map (\x -> x - 2) lst

functMap@[red,green,blue]=[5,6,7]

quicksort [] = []
quicksort (x:xs) = quicksort [val | val <- xs, y<x]
			    ++ x 
			    ++ quicksort [val | val <-xs, y>=x]

