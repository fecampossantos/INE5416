op :: Char -> Float -> Float -> Float
op operador x y
    | operador == '+' = x+y
    | operador == '-' = x-y
    | operador == '*' = x*y
    | operador == '/' = x/y

main = do
    print("Digite o primeiro numero, depois o operador e depois o segundo numero")
    
    xS <- getLine
    let x = (read xS :: Float)
    
    
    operador <- getChar
    t<-getLine
    
    yS <- getLine
    let y = (read yS :: Float)
    
    print(op operador x y)