import Data.Vect

data Cell : Nat -> Nat -> Type where 
  Cross : (r: Nat) -> (c: Nat) -> { auto p1: LT r rows} -> 
    { auto p2: LT c cols } -> Cell rows cols
  Circle : (r: Nat) -> (c: Nat) -> { auto p1: LT r rows} -> 
    { auto p2: LT c cols } -> Cell rows cols

data Board : (rows: Nat) -> (cols: Nat) -> Type where
  Cells : {n : Nat} -> Vect n (Cell rows cols) -> Board rows cols

addCell : Cell rows cols -> Board rows cols -> Board rows cols
addCell cl (Cells cs) = Cells (cl :: cs)

c : Cell 4 5
c = Cross 0 0

board : Board 4 5
board = Cells [Circle 3 3]
