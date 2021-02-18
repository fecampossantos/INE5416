filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f [] = []
filtrar f (a:b) | f a = a: (filtrar f b) | otherwise = filtrar f b

equatro :: Integer -> Bool
equatro n = n==4
    
main = do
    let lista = [1,2,3,4,5,6,7,8,9]
    print(filtrar equatro lista)