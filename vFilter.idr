import Data.Vect

vfilter : Vect n a -> (p : a -> Bool) -> Vect m a
vfilter [] p = []
vfilter (x :: xs) p = if p x then x :: vfilter xs
                             else vfilter xs

-- vfilter : (elem -> Bool) -> Vect len elem -> (m ** Vect m elem)
-- vfilter p [] = ( _ ** [] )
-- vfilter p (x::xs) =
--   let (_ ** tail) = vfilter p xs
--   in if p x then (_ ** x::tail)
--   else (_ ** tail)
