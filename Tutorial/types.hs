-- Type synonyms
type Point   = (Int,Int)
type Polygon = [Point]

triangulate :: Polygon -> [Polygon]
triangulate (a:b:c:xs) = [a,b,c]:triangulate (a:c:xs)
triangulate _ = []

-- Type signature declaration:
-- a is a "type variable"
myCoolFunction:: (Eq a) => a -> a -> Bool
-- Declaration:
myCoolFunction x y = x==y

-- Enums:
data MyBool  = True | False 
data MyColor = Red | Green | Blue | Pink

-- Type constructor - Data constructor
data MyList a = ListItem a
data MyPair a = PairItem a a

-- Point
data MyPoint a = MyPt a a 
-- Really delcares just this:
--	MyPt :: a -> a -> MyPoint a

-- MyPt 2.0 4.5		 :: MyPoint Float
-- MyPt True False		 :: MyPoint Bool 
-- MyPt "hello" "welcome" :: MyPoint String   <-- Oooopppss...

---------------------------




