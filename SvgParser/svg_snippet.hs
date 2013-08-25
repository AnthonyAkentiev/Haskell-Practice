
polygonA = ((100,100),(200,100),(200,200),(100,200))
polygonB = ((200,200),(300,200),(300,300),(200,300))


"<svg xmlns=\"http://www.w3.org/2000/svg\">" 
"</svg>"


"<polygon points=\""
	(writePoint x) ++ (writePoint y) ++ (writePoint z) ++ (writePoint w)
	++ "\" style=\"fill:#cccccc;stroke:rgb(" 
	++ (show r) ++ "," ++ (show g) ++ "," ++ (show b) 
	++ ");stroke-width:2\"/>"


