data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a) deriving (Show, Eq)

insert el Empty = Node el Empty Empty
insert el tree@(Node val left right)
        | val == el = tree
        | val > el = Node val (insert el left) right
        | val < el = Node val left (insert el right)

empty tree = tree == Empty

--valueOf Empty = []
valueOf tree@(Node val _ _) = val

isBinaryTree Empty = True
isBinaryTree tree@(Node val left right)
        | left == Empty && right == Empty = True
        | left == Empty = val < valueOf right && isBinaryTree right
        | right == Empty = val > valueOf left && isBinaryTree left
        | left /= Empty && right /= Empty = (val < (valueOf right)) && (val > (valueOf left)) && isBinaryTree left && isBinaryTree right

search el Empty = False
search el tree@(Node val left right)
        | val == el = True
        | val > el = search el left
        | val < el = search el right

vlr Empty = []
vlr tree@(Node val left right) = [val] ++ vlr left ++ vlr right

lvr Empty = []
lvr tree@(Node val left right) = lvr left ++ [val] ++ lvr right

lrv Empty = []
lrv tree@(Node val left right) = lrv left ++ lrv right ++ [val]

vrl Empty = []
vrl tree@(Node val left right) = [val] ++ vrl right ++ vrl left

rvl Empty = []
rvl tree@(Node val left right) = rvl right ++ [val] ++ rvl left

rlv Empty = []
rlv tree@(Node val left right) = rlv right ++ rlv left ++ [val]

toString Empty = ""
toString tree@(Node val left right) = (show val) ++ "(" ++ (toString left) ++ [','] ++ (toString right) ++ ")"

leaves Empty = []
leaves tree@(Node val left right)
        | left == Empty && right == Empty = [val]
        | otherwise = leaves left ++ leaves right

nnodes Empty = 0
nnodes tree@(Node val left right) = nnodes left + nnodes right + 1

nsum Empty = 0
nsum tree@(Node val left right) = nsum left + nsum right + val

treeMap function Empty = Empty
treeMap function tree@(Node val left right) = Node (function val) (treeMap function left) (treeMap function right)

rightMinElement tree@(Node val left _)
        | left == Empty = val
        | otherwise = rightMinElement left
        
remove el Empty = Empty
remove el tree@(Node val left right)
        | el == val = deleteElement el (Node val left right)
        | el < val = Node val (remove el left) right
        | el > val = Node val left (remove el right)
		
deleteElement el tree@(Node val left right)
        | left == Empty = right
        | right == Empty = left
        | otherwise = Node (rightMinElement right) left (remove (rightMinElement right) right)

fromList [] tree = tree
fromList (first : rest) tree = fromList rest (insert first tree)

dumpDOT tree@(Node val left right) = "digraph G {\n" ++ dumpDOT1 tree ++ "}"
dumpDOT1 tree@(Node val left right)  
        | tree == Empty = ""
        | left == Empty && right == Empty = ""
        | left /= Empty && right == Empty = (show val) ++ " -> " ++ (show (valueOf left)) ++ "\n" ++ dumpDOT1 left 
        | left == Empty && right /= Empty = (show val) ++ " -> " ++ (show (valueOf right)) ++ "\n" ++ dumpDOT1 right 
        | otherwise = (show val) ++ " -> " ++ (show (valueOf left)) ++ "\n" ++ (show val) ++ " -> " ++ (show (valueOf right)) ++ "\n" ++ dumpDOT1 left ++ dumpDOT1 right

getLevel level Empty = []
getLevel level tree@(Node val left right) 
        | level == 0 = [val]
        | otherwise = getLevel (level - 1) left ++ getLevel (level - 1) right

enumerateLevel tree = enumerateLevel2 tree 0
enumerateLevel2 Empty _ = Empty
enumerateLevel2 tree@(Node val left right) level = Node [val, level] (enumerateLevel2 left (level + 1)) (enumerateLevel2 right (level + 1))

{-

to test:

let tree = Node 1 Empty Empty
let tree2 = insert 5 tree
let tree3 = insert 10 tree2
let tree4 = insert 4 tree3
let tree5 = insert 20 tree4
let tree6 = insert 8 tree5
let tree7 = insert 9 tree6
let tree8 = insert 7 tree7
let tree9 = insert 21 tree8
let tree10 = insert 19 tree9

-}
