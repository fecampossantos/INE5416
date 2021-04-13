delta :: Float -> Float -> Float -> Float
delta a b c = (b^^2) - (4*a*c)


bhaskMenos :: Float -> Float -> Float -> Float
bhaskMenos a b del = (-b - sqrt del)/ 2*a

bhaskMais :: Float -> Float -> Float -> Float
bhaskMais a b del = (-b + sqrt del)/ 2*a


main = do
    print("Digite a, b e c em cada linha")
    aString <- getLine
    bString <- getLine
    cString <- getLine
    
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)


    let d = (delta a b c)
    
    print(d)
    
    if d < 0 then
        print("Nao existem raizes reais")
    else
        do
            let b1 = (bhaskMenos a b d)
            let b2 = (bhaskMais a b d)
            print("As raizes sao: ")
            print(b1)
            print(b2)