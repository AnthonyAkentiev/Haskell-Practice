
-- now declare a point 
funct1 :: MyPoint Double
funct1  = MyPt 2.0 3.0

processPoint :: (Num a) => MyPoint a -> a
processPoint (MyPt x y) = x + y 

-- User and admin 
data UserType name language experience = 
	  User String 
	| Admin String experience
	| Programmer String String experience

--make_admin :: String -> UserType String
make_admin name years_active = Admin name years_active
make_simple_user name = User name
make_anton = Programmer "Akentiev" "C++" 10



--------
anna_trishina (User usr) = "We dont need users right now!"
anna_trishina (Admin name exp) | exp>10 = "You are welcome..."
anna_trishina (Programmer name lang exp) | name=="Akentiev" && lang=="C++" && exp>10 = "Come get more money, Anton..."
anna_trishina _ = "You are too dumb. Sorry!"

-- Now hard:
data MyTree a = Leaf a | Branch (MyTree a) (MyTree a) 

-- Declares:
--    Leaf :: a -> MyTee a
--    Branch :: MyTree a -> MyTree a -> MyTree a
listAll:: MyTree a -> [a]

listAll (Leaf x) = [x]
listAll (Branch l r) = listAll l ++ listAll r 

tree1 = (Branch
			(Branch  
				(Leaf "dclient")
				(Leaf "mftp") 
			)
			(Branch 
				(Leaf "drv")
				(Leaf "cfg.monitoring")
			)
	   )

-- Classes
{-- 
class MyEq a where 
	(==) :: a-> a -> Bool 

instance MyEq Integer where 
	x == y = integerEq x y

instance MyEq Float where 
	x == y = floatEq x y 

instance MyEq MyTree where
	x == y = False 
--}

instance (Eq a) => Eq (MyTree a) where 
	Leaf a == Leaf b = a==b
	Branch a l r== Branch b l2 r2 = (a==b) && (l==l2) && (r==r2)


