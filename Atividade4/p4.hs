xor :: Bool -> Bool -> Bool
xor v1 v2 = (v1 && not v2) || (not v1 && v2)

main = do
    print("digite o primeiro valor 'True' ou 'False'")
    v1String <- getLine
    let v1 = (read v1String :: Bool)
    print("digite o segundo valor 'True' ou 'False'")
    v2String <- getLine
    let v2 = (read v2String :: Bool)
    
    print("XOR e")
    print(xor v1 v2)
    