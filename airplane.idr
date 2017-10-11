AirplaneState : Type
AirplaneState = (Nat, Nat)


data AirplaneCmd : (ty : Type) -> AirplaneState -> AirplaneState -> Type where
  Refuel : (f : Nat) -> AirplaneCmd () (fuel, flights) ((fuel + f), flights)
  Fly : (r : Nat) -> { auto p1 : LTE r f } -> { auto p2 : LT flights 2 } ->
    AirplaneCmd () (f, flights) (f - r, flights + 1)
  SafetyInspection : { auto p : GT flights 0 } -> AirplaneCmd () (fuel, flights) (fuel, Z)

  Pure : (ty : Type) -> AirplaneCmd ty s1 s2
  (>>=) : (AirplaneCmd a s1 s2) -> (a -> AirplaneCmd b s2 s3) -> (AirplaneCmd b s1 s3)

JHBToNYC : Nat
JHBToNYC = 45
  
JHBDubai : Nat
JHBDubai = 20

DubaiParis : Nat
DubaiParis = 15

flightPlan : AirplaneCmd () (0, 0) (0, 0)
flightPlan = do
  Refuel 80
  Fly JHBToNYC
  Fly JHBToNYC
  SafetyInspection
  Fly DubaiParis
  SafetyInspection
