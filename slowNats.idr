
-- In the repl Nats are slow 
-- because they are defined as a 
-- recursive algebraic datatype

slowPlus : Nat -> Nat -> Nat
slowPlus = (+)

main : IO ()
main = printLn $ slowPlus 1000000 1000000
