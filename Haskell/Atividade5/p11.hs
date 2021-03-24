primeiros :: Int -> [t] -> [t]
primeiros n (a:b)
    | n == 0 = []
    | n /= 0 = [a] ++ primeiros (n-1) b

main = do
    let lista = [1,2,3,4,5,6,7,8,9]
    print(primeiros 2 lista)