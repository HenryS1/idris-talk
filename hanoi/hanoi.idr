total
hanoi : Nat -> Integer
hanoi (S n) = 1 + 2 * hanoi n
hanoi Z = 0
