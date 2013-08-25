
import Main;

-- File reading:
main = do fromHandle <- getAndOpenFile "Copy from: " ReadMode
	toHandle <- getAndOpenFile "Copy to: " WriteMod	e
	contents <- hGetContents fromHandle
	hPutStr toHandle contents
	hClose toHandle
	putStr "Done."
	
getAndOpenFile :: String -> IOMode -> IO Handle
getAndOpenFile prompt mode =
	do putStr prompt
		name <- getLine
		catch (openFile name mode) 
		(\_ -> do putStrLn ("Cannot open "++ name ++ "\n")getAndOpenFile prompt mode)

