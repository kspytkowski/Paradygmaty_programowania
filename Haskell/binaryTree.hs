data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a) deriving (Eq)

data STree a = SEmpty | SLeaf a | SBranch a (STree a) (STree a) deriving (Eq)

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

{-instance Show a => Show (BinaryTree a) where
show Empty = "Empty"
show tree@(Node val Empty Empty) = "Node " ++ (show val) ++ "(Empty Empty)"
show tree@(Node val left Empty) = "Node " ++ (show val) ++ " " ++ "(" ++ (show left) ++ " Empty" ++ ")"
show tree@(Node val Empty right) = "Node " ++ (show val) ++ "(" ++ "Empty " ++ (show right) ++ ")"
show tree@(Node val left right) = "Node " ++ (show val) ++ " " ++ "(" ++ (show left) ++ ")" ++ "(" ++ (show right) ++ ")"
-}

convert Empty = SEmpty
convert tree@(Node val left right)
        | left == Empty && right == Empty = SLeaf val
        | left == Empty && right /= Empty = SBranch val SEmpty (convert right)
        | left /= Empty && right == Empty = SBranch val (convert left) SEmpty
        | otherwise = SBranch val (convert left) (convert right)

convertBack SEmpty = Empty
convertBack stree@(SLeaf val) = Node val Empty Empty
convertBack stree@(SBranch val left right)
        | left == SEmpty && right == SEmpty = Node val Empty Empty
        | left == SEmpty && right /= SEmpty = Node val Empty (convertBack right)
        | left /= SEmpty && right == SEmpty = Node val (convertBack left) Empty
        | otherwise = Node val (convertBack left) (convertBack right)
