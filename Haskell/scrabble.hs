import Data.Char
import Control.Monad

score letter
    | elem letter "aeinorswz" = 1
    | elem letter "cdklmpty" = 2
    | elem letter "bghjłu" = 3
    | elem letter "ąęfóśż" = 5
    | elem letter "ć" = 6
    | elem letter "ń" = 7
    | elem letter "ź" = 9
    | otherwise = 0
    
getScore word = foldr (+) 0 $ map score word

main = forever $ do
    contents <- readFile "slowa-utf8.txt"
    let wlist = lines contents
    word <- getLine
    print $ getScore word
