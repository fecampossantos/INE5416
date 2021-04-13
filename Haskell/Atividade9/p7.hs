{-
7. Utilize a fun¸c˜ao map que recebe como parˆametros uma lista num´erica e uma fun¸c˜ao lambda. A fun¸c˜ao
lambda deve retornar par ou ´ımpar para cada n´umero, ou seja, uma lista de booleans.
-}

main = do
    print( map (\x -> if x `mod` 2 == 0 then True else False) [1,2,3,4,5,6,7,8,9,10])