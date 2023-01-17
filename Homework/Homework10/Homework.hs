{-
-- Question 1 --
Continuing with the logistics software of the lesson:
 1. After using the `Container` type class for a while, you realize that it might need a few adjustments:
  	- First, write down the `Container` type class and its instances, same as we did in the lesson
  	  (try to do it without looking and check at the end or if you get stuck).
  	- Then, add a function called `unwrap` that gives you back the value inside a container.
 2. Create an instance for the `MailedBox` data type.
 	- The MailedBox data type represents a box sent through the mail.
 	- The parameter `t` is a tag with a person's identifier
 	- The parameter `d` is the person's details (address,etc).
 	- The parameter `a` is the content of the MailedBox
-}

class Container c where
  isEmpty :: c a -> Bool
  contains :: Eq a => c a -> a -> Bool 
  replace :: c a -> b -> c b
  unwrap :: c a -> a

data MailedBox t d a = EmptyMailBox t d | MailBoxTo t d a deriving (Show)

data Box a = Empty | Has a deriving (Show)

data Present t a = EmptyPresent t | PresentFor t a deriving (Show)

instance Container (Box) where
  isEmpty Empty = True 
  isEmpty _ = False

  contains (Empty) _ = False
  contains (Has a) b = a == b 

  replace (Empty) a = Has a
  replace (Has a) b = Has b 

  unwrap (Has a) = a


instance Container (Present t) where
  isEmpty (EmptyPresent _) = True 
  isEmpty _ = False

  contains (EmptyPresent t) _ = False
  contains (PresentFor t a) b = a == b 

  replace (EmptyPresent t) a = PresentFor t a 
  replace (PresentFor t a) b = PresentFor t b

  unwrap (PresentFor t a) = a


instance Container (MailedBox t d) where
  
  isEmpty (EmptyMailBox _ _)  = True 
  isEmpty _ = False

  contains (MailBoxTo t d a) b = a == b 
  contains (EmptyMailBox _ _ ) _ = False

  replace (MailBoxTo t d a) b = MailBoxTo t d b 
  replace (EmptyMailBox t d) b = MailBoxTo t d b

  unwrap (MailBoxTo t d a) = a


-- Question 2 --
-- Create instances for Show, Eq, and Ord for these three data types (use
-- automatic deriving whenever possible):

data Position = Intern | Junior | Senior | Manager | Chief deriving (Show,Eq,Ord)

data Experience = Programming | Managing | Leading deriving(Show,Eq,Ord)

type Address = String 

data Salary = USD Double | EUR Double deriving(Show)

instance Eq Salary where 
  USD x == USD y = x == y
  EUR x == EUR y = x == y 
  USD x == EUR y = x == (y * 1.08)
  EUR x == USD y = (1.08 * x) == y

instance Ord Salary where 
  compare (USD x)  (USD y) = compare x y
  compare (EUR x)  (EUR y) = compare x y 
  compare (USD x)  (EUR y) = compare x (y*1.08)
  compare (EUR x)  (USD y) = compare (x*1.08) y

data Relationship
  = Contractor Position Experience Salary Address
  | Employee Position Experience Salary Address
  deriving (Show,Eq,Ord)

data Pokemon = Pokemon
  { pName :: String,
    pType :: [String],
    pGeneration :: Int,
    pPokeDexNum :: Int
  }
  deriving (Show,Eq)

instance Ord Pokemon where
  compare x y = compare (pPokeDexNum x) (pPokeDexNum y)

charizard = Pokemon "Charizard" ["Fire", "Flying"] 1 6

venusaur = Pokemon "Venusaur" ["Grass", "Poison"] 1 3

-- Question 3 -- EXTRA CREDITS
-- Uncomment the next code and make it work (Google what you don't know).

-- -- Team memeber experience in years
newtype Exp = Exp Double

instance Num Exp where 
  (Exp a) + (Exp b) = Exp (a + b) 
  (Exp a) * (Exp b) = Exp (a * b) 

  abs (Exp a) = Exp (negate a) 
  negate (Exp a) = Exp (abs a) 
  signum (Exp a) = Exp (signum a)
  fromInteger a = Exp (fromInteger a)

--
-- -- Team memeber data
type TeamMember = (String, Exp)

--
-- -- List of memeber of the team
team :: [TeamMember]
team = [("John", Exp 5), ("Rick", Exp 2), ("Mary", Exp 6)]

-- -- Function to check the combined experience of the team
-- -- This function applied to `team` using GHCi should work
combineExp :: [TeamMember] -> Exp
combineExp = foldr ((+) . snd) 0


