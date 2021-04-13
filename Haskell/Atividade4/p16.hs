
divs :: Integer -> Integer -> Bool
divs x y =
    if mod x y == 0 then
        True
    else
        False

main = do
    aS <- getLine
    bS <- getLine
    let a = (read aS :: Integer)
    let b = (read bS :: Integer)
    print(divs a b)