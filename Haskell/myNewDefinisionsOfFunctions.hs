myHead [] = error "empty list"
myHead (head : _) = head

myLength [] = 0
myLength (_ : rest) = 1 + myLength(rest)

myTake 0 list = []
myTake _ [] = []
myTake n (head : rest)
        | n >= myLength (head : rest) = (head : rest)
        | n < myLength (head : rest) = head : myTake (n - 1) rest
        
myMap _ [] = []
myMap function (head : rest) = function head : myMap function rest

myPlusPlus [] n = n
myPlusPlus (head : rest) list = head : myPlusPlus rest list

