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

setEntry : Nat -> a -> Vect (S m) a -> Vect (S m) a 
setEntry n e v = recur n v
  where recur : (n : Nat) -> Vect (S i) a -> Vect (S i) a
        recur Z (x :: xs) = e :: xs
        recur (S j) (x :: y :: xs) = x :: (recur j (y :: xs))
  
