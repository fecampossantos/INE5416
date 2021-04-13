maiorNumero :: Float -> Float -> Float -> Float
maiorNumero a b c =
    if a >= b && a >= c then
        a
    else
        if b >= a && b >= c then
            b
        else
            c



main = do
    print("Digite os 3 numeros")
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)
    
    print("O maior numero e ")
    print(maiorNumero a b c)