apagar :: Int -> [t] -> [t]
apagar n (a:b)
    | n == 1 = b
    | n /= 0 = [] ++ apagar (n-1) b

main = do
    let lista = [1,2,3,4,5,6,7,8,9]
    print(apagar 7 lista) -- retorna [8,9]