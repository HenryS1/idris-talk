-- no base case
hanoi1 : Integer -> Integer
hanoi1 n = 1 + 2 * hanoi1 (n - 1)

