
-- Question 1
-- Write a multiline comment below.

{-- 

--}

-- Question 2
-- Define a function that takes a value and multiplies it by 3.

by3 :: Int -> Int
by3 x = x * 3

-- Question 3
-- Define a function that calculates the area of a circle.

circleArea radius = pi * radius ^ 2

-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder. 

cilinderVolume radius height = (circleArea radius) * height

-- Question 5
-- Define a function that takes the height and radius of a cylinder and checks if the volume is greater than or equal to 42.

cilinderCheck radius height = cilinderVolume radius height >= 42