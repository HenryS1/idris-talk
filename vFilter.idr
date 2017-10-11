import Data.Vect

-- this doesn't work because the signature suggests that any vector
-- works as the return type (a universal relationship)
-- vfilter : Vect n a -> (p : a -> Bool) -> Vect m a
-- vfilter [] p = []
-- vfilter (x :: xs) p = if p x then x :: vfilter xs
--                              else vfilter xs

-- this works because the dependent pair
-- encodes an existential relationship in the type 
-- (i.e. there exists a vector with the required length)
vFilter : (elem -> Bool) -> Vect len elem -> (m ** Vect m elem)
vFilter p [] = ( _ ** [] )
vFilter p (x::xs) =
  let (_ ** tail) = vFilter p xs
  in if p x then (_ ** x::tail)
  else (_ ** tail)
