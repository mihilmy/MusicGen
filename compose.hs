import Data.List
import MusicResources 
charIndex [] _ = []
charIndex (x:xs) c = map (+1) (findIndices (==c) x):charIndex xs c 
{-Indexes of all elements after a specific char.
charIndex training '0'
[[],[],[],[219,227,235,243,284,292,380,388,444,452],[]]-}
elements [] _ = []
elements (x:xs) l = if x < length l then l !! x:elements xs l else []
-- Elements at locations from charIndex
add_elements [] _ = []
add_elements (i:is) (a:as) = elements i a ++ add_elements is as 
{- ++ insiead of : to avoid duplicates of "" adds all the adjacent chars in one list
add_elements ([[],[],[],[219,227,235,243,284,292,380,388,444,452],[]]) training
"wwqqwwwwww"-}
removeDuplicates l = nub l
{-removeDuplicates "wwqqwwwwww"
"wq"-}
countOcc [] _ = []
countOcc (x:xs) l = length (findIndices (==x) l): countOcc (xs) l 
{--l is the list of duplicates and (x:xs) is the list without duplicates
Counts the occurneces of each character in another string
countOcc "wq" "wwqqwwwwww"
[8,2]-}
add [] [] = [] 
add (x:xs) (y:ys)= (x,y):add xs ys 
{- creates a tuple of (freq,char) x is the counter list y is the list from removeDuplicates
add [8,2] "wq"
[(8,'w'),(2,'q')]-}
run c l = add (countOcc(removeDuplicates (add_elements (charIndex l c) (l))) (add_elements (charIndex l c) (l))) (removeDuplicates (add_elements (charIndex l c) (l)))
{- run simply is the caller of add because add needs 2 things
1. An Output of the occurces from countOcc
2. A removed duplicates list
-}
stats [] _ = []
stats (x:xs) l = (x,reverse(sort(run x l))):stats xs l
{- Stats link the output in the list form of (char, chars after it and their freq)
It takes a list of chars and passes each one by one in run to get the the next chars and their frequencies
-}
makeStatsList = stats chars training
character z [] = []
character z [x] = []
character z (x:y:xs) = if(z==x) then [y] ++ character z xs
			else character z (y:xs)
help z [] =[]
help z (x:xs) = character z x ++ help z xs 
compose :: Char -> Int -> [Char]
compose x 0 =[]
compose x y = if(length(help x training)==0) then x:"" 
	else  [x] ++ compose (help x training!!randomZeroToX(length(help x training)-1)) (y-1)  