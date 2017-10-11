-- won't work for negative inputs
hanoi3 : Integer -> Integer
hanoi3 0 = 0
hanoi3 n = 1 + 2 * hanoi3 (n - 1)
