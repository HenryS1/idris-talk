import Data.Vect

appendVects : Vect n a -> Vect m a -> Vect (plus m n) a
appendVects v1 v2 = v1 ++ v2
