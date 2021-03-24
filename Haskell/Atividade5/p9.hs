mapear :: (t -> t) -> [t] -> [t]
mapear f [] = []
mapear f (a:b) = [f a] ++ mapear f b

dobra :: Integer -> Integer
dobra n = n*2
    
main = do
    let lista = [1,2,3,4,5,6,7,8,9]
    print(mapear dobra lista)