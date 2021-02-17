{- usando algoritmo de euclides -}

mdc :: Integer -> Integer -> Integer
mdc a b
    |mod a b == 0 = b
    |mod b a == 0 = a
    |a > b = mdc b (mod a b)
    |a < b = mdc a (mod b a)
    
main = do
    print("Insira os tres numeros")
    aS <- getLine
    bS <- getLine
    cS <- getLine
    
    let a = (read aS :: Integer)
    let b = (read bS :: Integer)
    let c = (read cS :: Integer)
    
    let maxdiv = mdc a (mdc b c)
    
    print("O maior divisor comum e")
    print(maxdiv)