
-- Question 1
-- Add the type signatures for the functions below and then remove the comments and try to compile.
-- (Use the types presented in the lecture.)

f1 :: Float -> Float -> Float -> Float
f1 x y z = x ** (y/z)

f2 :: Float -> Float -> Float -> Float
f2 x y z = sqrt (x/y - z)

f3 :: Bool -> Bool -> [Bool]
f3 x y = [x == True] ++ [y]

f4 :: (Eq a) => [a] -> [a] -> [a] -> Bool
f4 x y z = x == (y ++ z)


-- Question 2
-- Why should we define type signatures of functions? How c an they help you? How can they help others?

{--

Type signatures are a good way to describe how our functions behave, which kind of values are expected as input and
what output we expect as a result. In terms of readability, it could be said that it helps to describe in a more precisse 
manner what is the problem that our functions aims to solve, the types defined as inputs and outputs give clues of the problem.

--}


-- Question 3
-- Why should you define type signatures for variables? How can they help you?

{--

Defining type signatures for variables could be a good idea when we are composing functions, it could helps us to compose functions in 
a non ambigual manner. 


--}

-- Question 4
-- Are there any functions in Haskell that let you transform one type to the other? Try googling for the answer.

{--

Sure! Here is the translation of my previous response to English:

Yes, there are many functions in Haskell that allow you to transform one type to another. Some of them are:

    fromIntegral :: (Integral a, Num b) => a -> b: this function converts an integer number of type a to a more general number of type b, as long as b has an instance of the Num type class.

    toEnum :: (Enum a) => Int -> a: this function converts an Int to an element of any type that has an instance of the Enum type class.

    fromEnum :: (Enum a) => a -> Int: this function is the inverse of toEnum, and converts an element of a type that has an instance of Enum to an Int.

    realToFrac :: (Real a, Fractional b) => a -> b: this function converts a number of type a that has an instance of Real (such as Float or Double) to a number of type b that has an instance of Fractional.


--}

-- Question 5
-- Can you also define in Haskell list of lists? Did we showed any example of that? How would you access the inner
-- most elements?

-- Yes there is an example of a list of list and one way to access to them.

words = ["Hello","World","!"]
(words !! 0) !! 0 
-- "H"


