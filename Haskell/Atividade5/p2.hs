media :: [Int] -> Float
media [] = 0
media lista = (fromIntegral (soma lista)) / ( fromIntegral (comprimento lista))

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + sum b

comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + (comprimento b)

main = do
    let lista = [10,10,10,10,10,10,5]
    let med = media lista
    print(med)