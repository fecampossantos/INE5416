ordenacao :: [Int] -> [Int]
ordenacao [] = []
--adiciona cada elemento na lista ordenada
ordenacao (a:b) = add a (ordenacao b)

add :: Int -> [Int] -> [Int]
add a [] = [a]
add a (b:c) | (a <= b) = a : b : c
            | otherwise = b : (add a c)

comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + (comprimento b)

ultimoElemento :: [Int] -> Int
ultimoElemento [a] = a
ultimoElemento (_:b) = ultimoElemento b

            
main = do
    let lista = [5,4,2,7,6,1,8]
    let c = comprimento lista
    let ordlis = ordenacao lista
    let e1 = ordlis!!0
    let e2 = ultimoElemento ordlis
    print(e2 - e1)