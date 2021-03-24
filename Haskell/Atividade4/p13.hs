{- usando algoritmo de euclides -}

mdc :: Integer -> Integer -> Integer
mdc a b
    |mod a b == 0 = b
    |mod b a == 0 = a
    |a > b = mdc b (mod a b)
    |a < b = mdc a (mod b a)

minmult :: Integer -> Integer -> Integer
minmult a b = (a*b) `div` (mdc a b)
    
main = do
    print("Insira os dois numeros")
    aS <- getLine
    bS <- getLine
    
    let a = (read aS :: Integer)
    let b = (read bS :: Integer)
    
    let minmultresult = minmult a b
    
    print("O minimo multiplo comum e")
    print(minmultresult)