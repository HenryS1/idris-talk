import Data.Vect

vect3Head : Vect 3 a -> a
vect3Head = head

testVect3 : Vect 3 Int
testVect3 = [1, 2, 3]

testVect4 : Vect 4 Int
testVect4 = [1, 2, 3, 4]
 
--headOfVect4 : Int
--headOfVect4 = vect3Head testVect4
