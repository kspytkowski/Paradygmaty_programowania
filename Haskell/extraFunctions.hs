myFunction x = ("log " ++ (show x) ++ " ", x + 1)
sklej (first, second) function = (first ++ fst(function second), snd(function second))
nic costam = ("", costam)
makeMED function = nic.function
return arg = nic arg
(>>=) (first, second) function = sklej (first, second) function

