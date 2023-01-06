-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly. 
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).

-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.

electricalCheck :: Float -> Float -> Float -> [Char]
electricalCheck consumption hoursPerDay maxConsumption = let currentConsume = consumption * hoursPerDay * 30
   in if currentConsume > maxConsumption 
      then "Maximum consumption exceeded by: " ++ show (currentConsume - maxConsumption) ++ " kW" 
      else "consumption according to range limits, savings: " ++ show (maxConsumption - currentConsume) ++ " kW"


-- Question 3
-- Write a function that showcases the advantages of using let expressions to split a big expression into smaller ones.
-- Then, share it with other students in Canvas.

-- Without let expressions the code is more verbose.

vocalCount name = "Your name "  ++ name ++ " has " ++ (show $ length [ x  | x <- name, elem x ['A','E','I','O','U','a','e','i','o','u' ]]) ++ " vocals such as " ++  [ x  | x <- name, elem x ['A','E','I','O','U','a','e','i','o','u' ]]

-- With let expression is a lot more readable

vocalCount' name = let vocals = [ x  | x <- name, elem x ['A','E','I','O','U','a','e','i','o','u' ]]
 in "Your name "  ++ name ++ " has " ++ (show $ length vocals) ++ " vocals such as " ++ vocals


-- Question 4
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.  


quotient :: Float -> Float -> String
quotient a b
 | (a == 0) || (b == 0) = "Error: Division by zero is not possible"
 | otherwise = if a / b > 1 then show $ b / a else show $ a / b



-- Question 5
-- Write a function that takes in two numbers and calculates the sum of squares for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block. 


-- ( a * b ) ^ 2 + (a / b ^ 2)

squareOp a b = 
 let squareProduct = sqrt multiplication where multiplication = a * b 
 in squareProduct + squareQuotient
 where squareQuotient = let quotient = a / b in sqrt quotient
