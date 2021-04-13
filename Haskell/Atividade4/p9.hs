dist :: Float -> Float -> Float -> Float -> Float -> Float -> Float
dist x1 y1 z1 x2 y2 z2 = sqrt( (x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2)

main = do
    print("Digite os valores de x1, y1, z1, x2, y2, z2 separados por linha")
    x1String <- getLine
    y1String <- getLine
    z1String <- getLine
    x2String <- getLine
    y2String <- getLine
    z2String <- getLine
    
    let x1 = (read x1String :: Float)
    let y1 = (read y1String :: Float)
    let z1 = (read z1String :: Float)
    let x2 = (read x2String :: Float)
    let y2 = (read y2String :: Float)
    let z2 = (read z2String :: Float)
    
    print(dist x1 y1 z1 x2 y2 z2)