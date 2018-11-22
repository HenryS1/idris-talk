AirplaneState : Type
AirplaneState = (Nat, Nat)

-- state transitions for the flight plan encoded in a type family
-- the two AirplaneState arguments stipulate pre-conditions and 
-- post-conditions for transitions
data AirplaneCmd : (ty : Type) -> AirplaneState -> AirplaneState -> Type where
  Refuel : (f : Nat) -> AirplaneCmd () (fuel, flights) ((fuel + f), flights)
  Fly : (r : Nat) -> { auto p1 : LTE r f } -> { auto p2 : LT flights 2 } ->
    AirplaneCmd () (f, flights) (f - r, flights + 1)
  SafetyInspection : AirplaneCmd () (fuel, flights) (fuel, Z)

  Pure : (ty : Type) -> AirplaneCmd ty s1 s2
  (>>=) : (AirplaneCmd a s1 s2) -> (a -> AirplaneCmd b s2 s3) -> (AirplaneCmd b s1 s3)

JHBToNYC : Nat
JHBToNYC = 45
  
NYCToDubai : Nat
NYCToDubai = 35

DubaiParis : Nat
DubaiParis = 15

flightPlan : { auto pInitFlights : LTE flights 2 } -> (eFl ** eFu ** AirplaneCmd () (0, 0) (eFl, eFu))
flightPlan = (_ ** _ ** do 
  SafetyInspection 
  Refuel 80
  Fly JHBToNYC
  Fly NYCToDubai)


