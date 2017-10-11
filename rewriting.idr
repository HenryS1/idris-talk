import Data.Vect

-- function transforms type of expression to to swap m and n
appendRewrite : (n : Nat) -> (m : Nat) -> Vect (n + m) a -> Vect (m + n) a
appendRewrite n m v = rewrite plusCommutative m n in v

-- use rewrite helper to get the correct return type
appendVects : Vect n a -> Vect m a -> Vect (plus m n) a
appendVects {n} {m} v1 v2 = appendRewrite n m (v1 ++ v2)
