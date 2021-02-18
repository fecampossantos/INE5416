menorLista :: [Int] -> Int
menorLista [] = 0
menorLista [a] = a
menorLista (a:b) = menorItem a (menorLista b)

menorItem :: Int -> Int -> Int
menorItem a b
    | a < b = a
    | a > b = b
    | a == b = a
    
main = do
    let l1 = [1, 2, 3]
    print(menorLista l1)
    let l2 = [3, 2, 1]
    print(menorLista l2)
    let l3 = [3, 1, 2]
    print(menorLista l3)