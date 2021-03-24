{-
4. Crie uma express˜ao Lambda que resolva uma equa¸c˜ao de segundo grau da forma ax2 +bx + c utilizando
a f´ormula de Bhaskara. Leia os coeficientes a, b e c do teclado.
-}

bhsk :: Float -> Float -> Float -> [Float]
bhsk a b c = 
    if ((\x y z -> b*b - 4*x*z) a b c) >= 0 then
        [((\a b c -> ((-b)+(sqrt ((\x y z -> b*b - 4*x*z) a b c)))/2*a) a b c), ((\a b c -> ((-b)-(sqrt ((\x y z -> b*b - 4*x*z) a b c)))/2*a) a b c)]
    else
        [0,0]

main = do
    print("Digite os 3 coeficientes da equacao")
    p11 <- getLine
    let p1 = read p11 :: Float
    p21 <- getLine
    let p2 = read p21 :: Float
    p31 <- getLine
    let p3 = read p31 :: Float
    print(bhsk p1 p2 p3)