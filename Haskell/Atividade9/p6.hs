{-
6. Crie uma express˜ao Lambda que receba 3 valores num´ericos (a, b, c) e retorne o maior deles. N˜ao utilize
nenhuma forma de ordena¸c˜ao. Leia os valores a, b, c do teclado.
-}

main = do
    print("Digite os 3 valores")
    x11 <- getLine
    let x1 = read x11 :: Int
    y11 <- getLine
    let y1 = read y11 :: Int
    z11 <- getLine
    let z1 = read z11 :: Int

    let big = ((\a b c -> if a > b && a > c then a
                            else if b > c && b > a then b
                            else c ) x1 y1 z1)

    print("O maior valor e")
    print(big)