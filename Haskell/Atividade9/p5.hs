{-
5. Crie uma express˜ao Lambda que dados dois pontos no espa¸co 3D, (x1, y1, z1) e (x2, y2, z2), compute a
distˆancia entre eles. Leia as posi¸c˜oes dos pontos do teclado
-}

main = do
    print("Digite x y e z do ponto 1")
    x11 <- getLine
    let x1 = read x11 :: Float
    y11 <- getLine
    let y1 = read y11 :: Float
    z11 <- getLine
    let z1 = read z11 :: Float

    print("Digite x y e z do ponto 2")
    x21 <- getLine
    let x2 = read x21 :: Float
    y21 <- getLine
    let y2 = read y21 :: Float
    z21 <- getLine
    let z2 = read z21 :: Float

    let d = ((\a b c x y z -> sqrt( (x-a)**2 + (y-b)**2 + (z-c)**2 )) x1 y1 z1 x2 y2 z2)
    print("d(p1, p2)= ")
    print(d)