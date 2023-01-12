-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?

-- Awnser: The `Bounded` type class defines a minimum and maximum limit of some type.
-- The types that are member of the `Bounded` typeclass can work with minBound and maxBound
-- eg:
-- minBound :: Bool
-- False

-- maxBound :: Char
-- '\1114111'

-- Question 2
-- The types Int and Word bellong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.

-- The difference between the two is that type Int is signed and Word is not,
-- so one is represeting the integers and the other the natural numbers.
-- Word have a higher positive bound than Int. 

-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?

-- It is a typeclass that allows to order a type sequencially by mapping its values 
-- to integers, so the they can be enumerated in terms of predecessor and succesor
-- which allows to use the pred and succ functions. 


-- Question 4
-- Add type signatures to the functions below and use type variables and type classes.
-- Then uncomment the functions and try to compile.

f1 :: (Fractional a, Fractional b) => a -> b -> String -> String
f1 x y z = show (x / y) ++ z

f2 :: (Bounded a, Enum a, Eq a) => a -> a
f2 x = if x == maxBound then minBound else succ x


-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.

{--

Num
Is a typeclass that includes all other numerica types. A function to convert from Integer to Int.
fromInteger :: Integer -> a

Real
Also a typeclass covering those types that can be represented as a real value (the Rational type).
toRational :: a -> Rational

Integral
A type class for integrals.
Integral includes only integral (whole) numbers. In this typeclass are Int and Integer.
fromIntegral :: (Num b, Integral a) => a -> b


PD: 
What is the difference between Int and Integral.
https://wiki.haskell.org/FAQ#What.27s_the_difference_between_Integer_and_Int.3F

Another interesting topic:
https://serokell.io/blog/haskell-typeclasses
--}