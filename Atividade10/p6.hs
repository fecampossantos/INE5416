reverseL :: [Int] -> [Int]
reverseL [] = []
reverseL (a:b) = (reverse b) ++ [a]

doubleL :: [Int] -> [Int]
doubleL [] = []
doubleL (a:b) = (a*2) : (doubleL b)

main = do
    let list = [1,2,3,4,5,6]
    print(reverseL list)
    print(doubleL (reverseL list))
    print(fmap reverseL list)