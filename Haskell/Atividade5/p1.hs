soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

main = do
    let lista = [1, 3]
    let a = soma lista
    print(a)