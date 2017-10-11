-- no guarantee that n - 1 > 0 so type check fails
hanoi4 : Nat -> Integer
hanoi4 n = 1 + 2 * hanoi4 (n - 1)
hanoi4 0 = 0
