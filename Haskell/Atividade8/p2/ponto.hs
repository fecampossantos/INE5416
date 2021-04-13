module Ponto(Ponto(Ponto2D), distancia, colineares, formaTriangulo, formaTriangulo2, getDistancias, 
            determinante, getTupleFromList) where

    data Ponto = Ponto2D Float Float

    distancia:: Ponto -> Ponto -> Float
    distancia (Ponto2D x1 y1) (Ponto2D x2 y2) = sqrt((x2-x1)**2 + (y2-y1)**2) 

    colineares:: Ponto -> Ponto -> Ponto -> Bool
    colineares (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) =
        if (determinante (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) == 0) 
            then True
        else 
            False
    
    determinante :: Ponto -> Ponto -> Ponto -> Float
    determinante (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) = (x1*y2 + x2*y3 + x3*y1) - (x3*y2 + y3*x1 + x2*y1)

    {-
    Condição de existencia de um triangulo
    | b - c | < a < b + c
    | a - c | < b < a + c
    | a - b | < c < a + b
    -}
    formaTriangulo2 :: (Float, Float, Float) -> Bool
    formaTriangulo2 (a, b, c) = 
        if (isBetween a b c) && (isBetween b a c) && (isBetween c a b) then True
        else False
    
    formaTriangulo :: Ponto -> Ponto -> Ponto -> Bool
    formaTriangulo (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3) = do
        let dis = getDistancias (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3)
        let dis2 = getTupleFromList dis
        formaTriangulo2 dis2

    isBetween :: Float -> Float -> Float -> Bool
    isBetween a b c = 
        if a > (abs (b-c)) && a < b+c then True
        else False

    getDistancias :: Ponto -> Ponto -> Ponto -> [Float]
    getDistancias (Ponto2D p1x p1y) (Ponto2D p2x p2y) (Ponto2D p3x p3y) = (distancia (Ponto2D p1x p1y) (Ponto2D p2x p2y)) : (distancia (Ponto2D p1x p1y) (Ponto2D p3x p3y)) : (distancia (Ponto2D p2x p2y) (Ponto2D p3x p3y)) : []

    getTupleFromList :: [Float] -> (Float, Float, Float)
    getTupleFromList [a,b,c] = (a,b,c)