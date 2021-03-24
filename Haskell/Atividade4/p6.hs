moduloSub :: Float -> Float -> Float
moduloSub x  y= 
    if (x-y) < 0 then
        (x-y)*(-1)
    else
        (x-y)

maiorNumero :: Float -> Float -> Float -> Float
maiorNumero a b c =
    if a >= b && a >= c then
        a
    else
        if b >= a && b >= c then
            b
        else
            c

menorNumero :: Float -> Float -> Float -> Float
menorNumero a b c =
    if a <= b && a <= c then
        a
    else
        if b <= a && b <= c then
            b
        else
            c

meioNumero :: Float -> Float -> Float -> Float
meioNumero a b c
    | a <= b && a >= c = a
    | a <= c && a >= b = a
    | b <= c && b >= a = b
    | b <= a && b >= c = b
    | c <= a && c >= b = c
    | c <= b && c >= a = c


existencia :: Float -> Float -> Float -> Bool
existencia a soma sub = 
    if a > soma || a < sub then
        False
    else
        True
    
existe :: Bool -> Bool -> Bool -> String
existe e1 e2 e3 = 
    if e1 && e2 && e3 then
        "Existe"
    else
        "Nao Existe"


main = do
    print("Digite os 3 lados do triangulo dando enter entre eles")
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)
    
    -- pra a
    let subBC = (moduloSub b c)
    let somaBC = b + c
    let existenciaA = (existencia a somaBC subBC)
    
    -- pra b
    let subAC = (moduloSub a c)
    let somaAC = a + c
    let existenciaB = (existencia b somaAC subAC)
    
    -- pra c
    let subAB = (moduloSub a b)
    let somaAB = a + b
    let existenciaC = (existencia c somaAB subAB)
    
    
    print(existe existenciaA existenciaB existenciaC)