-- See the Hitchhikers guide to Haskell
import Text.ParserCombinators.Parsec
import Data.List (sortBy)
 
data Dir = Dir Int String deriving Show
data Pack = Pack [Dir] deriving Show 

-- parseInput parses output of "du -sb", which consists of many lines,
-- each of which describes single directory
parseInput = 
  do dirs <- many dirAndSize
     eof :: Parser ()
     return dirs

dirAndSize = 
	do size <- many1 digit 
	   spaces
	   dir_name <- anyChar `manyTill` newline
	   return (Dir (read size) dir_name)

dir_size (Dir size dir) = size 

get_dirs_size :: [Dir] -> Int
get_dirs_size[] = 0
get_dirs_size (x:xs) = dir_size x + get_dirs_size xs  

get_pack_size :: Pack -> Int
get_pack_size (Pack dirs) = get_dirs_size dirs

max_cd_size = 700 * 1024 * 1024 

new_dirs = [(Dir 10 "hello")]

maybe_add_dir :: Dir -> Pack -> Pack 
maybe_add_dir d p | new_sz > max_cd_size = Pack new_dirs
	where 
		new_sz = get_pack_size p + dir_size d 
maybe_add_dir d p = p

--get_pack_dir p

main = do input <- getContents
          putStrLn ("DEBUG: got input " ++ input)
          let dirs = case parse parseInput "stdin" input of
                          Left err -> error $ "Input:\n" ++ show input ++ 
                                              "\nError:\n" ++ show err
                          Right result -> result
          putStrLn "DEBUG: parsed:";
		print dirs
