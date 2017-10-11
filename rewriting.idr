import Data.Vect

appendRewrite : (n : Nat) -> (m : Nat) -> Vect (n + m) a -> Vect (m + n) a
appendRewrite n m v = rewrite plusCommutative m n in v

appendVects : Vect n a -> Vect m a -> Vect (plus m n) a
appendVects {n} {m} v1 v2 = appendRewrite n m (v1 ++ v2)
