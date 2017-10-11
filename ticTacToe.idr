import Data.Vect

data Entry = Circle | Cross | Blank

data Player : Entry -> Type where
  CirclePlayer : Player Circle
  CrossPlayer : Player Cross

Move : Type
Move = (Int, Int, Entry)

Row : Type 
Row = Vect 3 Entry

Grid : Type
Grid = Vect 3 Row

emptyGrid : Grid 
emptyGrid = [[Blank, Blank, Blank],
             [Blank, Blank, Blank],
             [Blank, Blank, Blank]]

-- corrected version of set entry that uses implicit proofs to guarantee that
-- arguments are in bounds
-- proof is transformed on each recursive call to generate the correct proof 
-- for that case
total
setEntry : (n : Nat) -> { auto p : LT n (S m) } -> a -> Vect (S m) a -> Vect (S m) a 
setEntry n {p} e v = recur n p v
  where recur : (n : Nat) -> (p : LT n (S i)) -> Vect (S i) a -> Vect (S i) a
        recur Z p (x :: xs) = e :: xs
        recur (S j) p (x :: y :: xs) = x :: (recur j (fromLteSucc p) (y :: xs))
        recur (S j) (succNotLTEzero (fromLteSucc LTEZero)) [x] impossible

total
setColumn : (n : Nat) -> { auto prf : LT n 3 } -> Entry -> Row -> Row
setColumn = setEntry

total
setRow : (n : Nat) -> { auto prf : LT n 3} -> Row -> Grid -> Grid 
setRow = setEntry 

total
getEntry : (n : Nat) -> { auto prf : LT n (S m) } -> Vect (S m) a -> a
getEntry {prf} n g = recur n prf g 
  where recur : (n : Nat) -> (p : LT n (S i)) -> Vect (S i) a -> a
        recur Z p (r :: rs) = r
        recur (S j) p (r :: x :: rs) = recur j (fromLteSucc p) (x :: rs)
        recur (S j) (succNotLTEzero (fromLteSucc LTEZero)) [x] impossible

total 
getRow : (n : Nat) -> { auto prf : LT n 3 } -> Grid -> Row
getRow = getEntry

total 
getCol : (n : Nat) -> { auto prf : LT n 3 } -> Row -> Entry
getCol = getEntry

total
setGridEntry : (n : Nat) -> (m : Nat) -> { auto p1 : LT n 3 } 
                                 -> { auto p2 : LT m 3 } -> Entry -> Grid -> Grid
setGridEntry n m e g = setRow n r g 
   where r = setColumn m e (getRow n g)
