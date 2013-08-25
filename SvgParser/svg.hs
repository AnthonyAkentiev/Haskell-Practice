module SvgWriter where

type Point = (Int,Int)
type Color = (Int,Int,Int)
type Polygon = (Point,Point,Point,Point)

data ColorName = Red | Green | Blue

rainbow :: ColorName -> Color
rainbow Red	= (255,0,0)
rainbow Green	= (0,255,0)
rainbow Blue	= (0,0,255) 

writePoint:: Point -> String 
writePoint (x,y) = (show x) ++ "," ++ (show y) ++ " "

writePolygon:: Color -> Polygon -> String
writePolygon (r,g,b) (x,y,z,w) = "<polygon points=\""
	++ (writePoint x) ++ (writePoint y) ++ (writePoint z) ++ (writePoint w)
	++ "\" style=\"fill:#cccccc;stroke:rgb(" 
	++ (show r) ++ "," ++ (show g) ++ "," ++ (show b) 
	++ ");stroke-width:2\"/>"

writePolygons :: Color -> [Polygon] -> String
writePolygons clr [] = []
writePolygons clr (x:xs) = (writePolygon clr x) ++ (writePolygons clr xs) 

polygonA = ((100,100),(200,100),(200,200),(100,200))
polygonB = ((200,200),(300,200),(300,300),(200,300))

my_string_f = "<svg xmlns=\"http://www.w3.org/2000/svg\">"++ 
	writePolygons (rainbow Red) [polygonA,polygonB] ++ "</svg>"

main = writeFile "try.svg" my_string_f

