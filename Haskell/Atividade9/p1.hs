{-
Crie uma express˜ao Lambda que receba dois valores booleanos (x, y) retorne o resultado do “ou exclusivo”
(XOR) sobre eles. Leia os valores x e y do teclado.
-}
xor1 :: Bool -> Bool -> Bool
xor1 a b = ((\k l ->  k /= l) a b)

getValue :: [Char] -> Bool
getValue x =
    if x == "True" then True
    else False

main = do
    print("Digite os dois valores (True ou False)")
    v11 <- getLine
    let v1 = getValue v11
    v21 <- getLine
    let v2 = getValue v21
    print("O XOR é:")
    print(xor1 v1 v2)