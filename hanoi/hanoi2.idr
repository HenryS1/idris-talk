total
hanoi2 : Integer -> Integer
hanoi2 n = 1 + 2 * hanoi2 (n - 1)
hanoi2 0 = 0
