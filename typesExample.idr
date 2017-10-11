data TypeToggle = MyInt | MyBool | MyString

myType : TypeToggle -> Type
myType MyInt = Int
myType MyBool = Bool
myType MyString = String

toggleType : (t : TypeToggle) -> myType t
toggleType MyInt = 100
toggleType MyBool = False
toggleType MyString = "Hello World!"

cliche : String
cliche = toggleType MyString
