expo :: Float -> Float -> Float
expo x y = x**y

main = do
    print("DIGITE X")
    xString <- getLine
    print("DIGITE Y")
    yString <- getLine
    
    let x = (read xString :: Float)
    let y = (read yString :: Float)
    
    let resultado = (expo x y)
    
    print("X elevado a Y e :")
    print(resultado)