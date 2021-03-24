{-
3. Crie uma fun¸c˜ao com a assinatura formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float,
Float) -> Maybe Float, a qual recebe trˆes pontos 2D como parˆametro e retorna a ´area do triˆangulo ou
Nothing, caso os trˆes pontos n˜ao formem um triˆangulo. Utilize o conceito de Monad para esta quest˜ao
-}

formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Maybe Float
formaTriangulo (x1,y1) (x2,y2) (x3,y3) = do
    a <- distancia (x1,y1) (x2,y2)
    b <- distancia (x2,y2) (x3,y3)
    c <- distancia (x3,y3) (x1,y1)
    if (formaTriangulo2 (a,b,c)) then Just (getArea (a,b,c))
    else Nothing


distancia :: (Float, Float) -> (Float, Float) -> Maybe Float
distancia (x1,y1) (x2,y2)   | sqrt( ((x2-x1)**2) + ((y2-y1)**2)) >= 0 = Just (sqrt( ((x2-x1)**2) + ((y2-y1)**2)))
                            | otherwise = Nothing


formaTriangulo2 :: (Float, Float, Float) -> Bool
formaTriangulo2 (a, b, c) = 
    if (isBetween a b c) && (isBetween b a c) && (isBetween c a b) then
        True
    else
        False

isBetween :: Float -> Float -> Float -> Bool
isBetween a b c = 
    if a > (abs (b-c)) && a < b+c then True
    else False

getArea :: (Float, Float, Float) -> Float
getArea (a, b, c)
    | a == b && b == c = (c * c) * ((sqrt 3)/4.0)  -- triangulo equilatero
    | a*a + b*b == c*c = (a*b)/2                   -- triangulo retangulo
    | c*c + b*b == a*a = (c*b)/2                   -- triangulo retangulo
    | a*a + c*c == b*b = (a*c)/2                   -- triangulo retangulo
    | a == b && a /= c = (getAltura a (c/2))*c/2   -- triangulo isosceles
    | a == c && a /= b = (getAltura a (b/2))*b/2   -- triangulo isosceles
    | b == c && c /= a = (getAltura b (a/2))*a/2   -- triangulo isosceles
    | a /= b && b /= c = sqrt((getSemiPerimetro a b c)*((getSemiPerimetro a b c)-a)*((getSemiPerimetro a b c)-b)*((getSemiPerimetro a b c)-c))  -- triangulo escaleno (formula de herao)

getSemiPerimetro :: Float -> Float -> Float -> Float
getSemiPerimetro a b c = (a+b+c)/2

getAltura :: Float -> Float -> Float
getAltura a b
    | a > b = sqrt(a*a - b*b)
    | a < b = sqrt(b*b - a*a)
    | a==b = sqrt(a*a - b*b)


main = do
    print( formaTriangulo (0,0) (3,0) (0,4)) --triangulo retangulo de area 6
    print( formaTriangulo (0,0) (3,0) (120, 0)) -- nao forma triangulo