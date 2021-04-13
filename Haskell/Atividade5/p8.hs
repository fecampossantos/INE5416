inverte :: [t] -> [t]
inverte [x] = [x]
inverte (a:b) = inverte b ++ [a]

main = do
    let lista = [1,2,3,4,5]
    print(inverte lista)