
-- in ... [1,2,2,3,3,4,1,1,2,3,3,3,3]
--   result... [[1],[2,2],[3,3],[4],[1,1],[2],[3,3,3]]
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:xs) = if x `elem` (head (pack xs))
              then (x:(head (pack xs))):(tail (pack xs))
              else [x]:(pack xs)

-------------------------------------------
-- in... [['a','a'],['b','b','b'],['a','a'],['c'],['a','a']]
--	result... [('a',2),('b',3),('a',2),('c',1),('a',2)]
get_count_tuple:: [a] -> [(a,Int)]
get_count_tuple [] = []
get_count_tuple (x:xs) = [(x, length xs + 1)]

run_length_encoding [] = []
run_length_encoding (x:xs) = get_count_tuple x ++ run_length_encoding xs

