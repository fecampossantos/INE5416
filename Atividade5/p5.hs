--ghc 8.0.2

busca :: [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) x
    | a == x = True
    | a /= x = busca b x


main = do
    let lista = [1,2,3,4,5,6,8,9]
    print(busca lista 1)
    print(busca lista 7)