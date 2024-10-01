-------------------------------------------------------------------------------
-- Syntax
-- Which statements are correct?

s1 :: Int -> Bool
s1 a | a < 0     = False
     | otherwise = True

r1 = s1 2
--
s2 :: Int -> Bool
s2 i = f i > 2
    where f :: Int -> Int
          f i = -i

r2 = s2 5
--
s3 b = let i = 42
        in if b then i else 0

r3 = s3 True
-------------------------------------------------------------------------------
-- Pairs
p1 = fst (True, ":)")

p2 = snd (('a', True), fst) ("x", "y")

fp3 (a, true, 'c') = a
fp3 (_, _   , n )  = n

p3 = fp3 ('x', False, 'c')




-------------------------------------------------------------------------------
-- Lists

l1 = 'a' : 'b' : 'c' : []
l2 = ['a', 'b', 'c']
l3 = "abc"

--l4 = head [1, True, 3]

fl5 (a:as) = as ++ [a]

l5 = fl5 [1]

-------------------------------------------------------------------------------
-- List Functions

lf1 = map head ["ab","de","ve", "pq", "rs", "pq", "ab"]

lf2 = filter fst [(True, 1), (False, 2), (False, 3)]

lf3 = foldr (\(_,p) a -> a + p) 0 [("Bread", 4), ("Milk", 2)]


-------------------------------------------------------------------------------
-- ADT

data Error = A | B String | C Int Bool

data Result a = Bad Error | Good a

data Tree a = MkTree a [Tree a]



-------------------------------------------------------------------------------
-- Functions

ff1 :: Int -> Bool -> Int
ff1 i b = if b then i else -i

f1 = ff1 1

ff2 :: (Int -> Bool) -> Int
ff2 f | f 0 = 0
ff2 _       = 100

f2 = ff2 (\i -> i == 0)

f3 = ff2 (== 0)

-------------------------------------------------------------------------------
-- Recursion

rf1 :: Int -> [Int]
rf1 n | n <= 0    = [0]
      | otherwise = n : (rf1 (n-2)) ++ [n] 

rr1 = rf1 5
rr1' = rf1 4

rf2 :: [a] -> [(a->b)] -> [b]
rf2 []     _      = []
rf2 _      []     = []
rf2 (a:as) (f:fs) = f a : rf2 as fs

rr2 = rf2 [(1,2), (3,4)] [fst, snd]
rr2' = rf2 ["abc", "abc"] [(\(x:y:z) -> y), head]

-------------------------------------------------------------------------------
-- Types
{-
(.) :: (b -> c) -> (a -> b) -> (a -> c)
map :: (a -> b) -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]
fst :: (a,b) -> a
snd :: (a,b) -> b
-}

-- snd (True, snd) :: (a, b) -> b Correct
-- fst snd :: (a,b) Wrong
-- map filter :: [a -> Bool] -> [[a] -> [a]] Correct
-- fst . snd :: (a, (b, c)) -> b Correct

