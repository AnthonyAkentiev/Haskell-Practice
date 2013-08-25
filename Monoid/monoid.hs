import Data.Monoid
import Data.Foldable
import Control.Monad.Writer
import Control.Monad.State

-- The Writer is a monad that collect anything
fact :: Integer -> Writer (Sum Integer) Integer
fact 0 = return 1
fact n = do
	let n' = n -1
	tell $ Sum 1
	m <- fact n'
	let r = n * m
	tell $ Sum 1
	return r

fact2 :: Integer -> Writer (String) Integer
fact2 0 = return 1
fact2 n = do
	let n' = n -1
	tell $ "We have taken one away from" ++ show n ++ "\n"
	m <- fact2 n'
	let r = n * m
	return r


