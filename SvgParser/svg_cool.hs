import Data.List 
import Text.Regex 
import System.Random 
import Data.Ord

type Point	= (Float,Float) 
type Color	= (Int,Int,Int) 
type Polygon	= [Point] 
type Person	= [Int]
type Link	= [Point] 

--type Placement = [(Point,Person)]
--type EnergyFunction a 
--type TemperatureFunction 
--type TransitionProbabilityFunction = Int -> Int -> Float -> Float 
--type MotionFunction a = StdGen -> a -> (StdGen,a)

------------------------------------ WRITING 
writePoint :: Point -> String 
writePoint (x,y) = (show x)++","++(show y)++" "

writePolygon :: (Color,Polygon) -> String 
writePolygon ((r,g,b),p) = 
	"<polygon points=\"" 
	++ (concatMap writePoint p) 
	++ "\" style=\"fill:#cccccc;stroke:rgb(" 
	++(show r)++","++(show g)++","++(show b) 
	++");stroke-width:2\"/>"

writePolygons :: [(Color,Polygon)] -> String 
writePolygons p = "<svg xmlns=\"http://www.w3.org/2000/svg\">"
	++(concatMap writePolygon p)++"</svg>"

colorize :: Color -> [Polygon] -> [(Color,Polygon)] 
colorize = zip.repeat

rainbow@[red,green,blue,yellow,purple,teal] 
	= map colorize [(255,0,0), (0,255,0),(0,0,255),(255,255,0),(255,0,255),(0,255,255)]

-------------------- READING: 
readPoint :: String -> Point 
readPoint s | Just [x,y] <- matchRegex (mkRegex "([0-9.]+),([0-9.]+)") s = (read x,read y)

readPolygon :: String -> Polygon 
readPolygon = (map readPoint).(splitRegex $ mkRegex " L ")

readPolygons :: String -> [Polygon] 
readPolygons = (map readPolygon).tail.(splitRegex $ mkRegex "<path")

main  = do 
	park_data <-readFile "park.svg" 
	let park = readPolygons park_data
	let polySome = [[(100,100),(200,100),(200,200), (100,200)],[(200,200),(300,200),(300,300),(200,300)]]
	writeFile "tut0.svg" $ writePolygons ((blue park) ++ (red polySome))
