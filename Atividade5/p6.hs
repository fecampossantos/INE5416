--ghc 8.0.2

ocorrencias :: [Int] -> Int -> Int
ocorrencias [] _ = 0
ocorrencias (a:b) n
    | a == n = 1 + (ocorrencias b n)
    | a /= n = (ocorrencias b n)

main = do
    let lista = [1,2,3,4,5,6,7,1,9]
    print(ocorrencias lista 8) -- retorna 0
    print(ocorrencias lista 6) -- retorna 1
    print(ocorrencias lista 1) -- retorna 2