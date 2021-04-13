areaRetangulo :: Float -> Float -> Float
areaRetangulo base altura = base*altura

main = do
    print("Digite a base")
    baseString <- getLine
    print("Digite a altura")
    alturaString <- getLine
    
    let base = (read baseString :: Float)
    let altura = (read alturaString :: Float)
    
    print("A area e")
    print(areaRetangulo base altura)