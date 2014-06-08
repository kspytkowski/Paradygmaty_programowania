mySum list = foldr (+) 0 list
myProduct list = foldr (*) 1 list
stick a b = b ++ [a] 
myReverse list = foldr (stick) [] list
myAND list = foldr (&&) True list
myOR list = foldr (||) False list
myNewHead list = foldr (\a b -> a) (head list)  []
myNewLast list = foldl (\a b -> b) (last list ) []
