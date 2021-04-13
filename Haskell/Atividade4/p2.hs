modulo :: Float -> Float
modulo x =
    if x < 0 then
        x*(-1)
    else
        x

main = do
    print("Digite x")
    xString <- getLine
    let x = (read xString :: Float)
    print(modulo x)