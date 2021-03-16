{- 
Al´em das opera¸c˜oes inclu´ıdas no problema anterior, inclua tamb´em uma opera¸c˜ao para raiz quadrada,
na forma Sqrt Expr. Trate a situa¸c˜ao de raiz quadrada de n´umero negativo como erro (utilize o Monad
Maybe para isso). Fa¸ca as modifica¸c˜oes necess´arias nas fun¸c˜oes de avalia¸c˜ao criadas e crie ao menos trˆes
exemplos de express˜oes para testar sua solu¸c˜ao. As modifica¸c˜oes devem ser feitas nas trˆes formas de
criar esta fun¸c˜ao vistas em sala de aula (sem usar monads, usando >>= e usando a nota¸c˜ao do. N˜ao
preocupe-se com precedˆencia de operadores. Qual forma foi mais f´acil de dar manuten¸c˜ao? E mais dif´ıcil?
-}

data Expr = Val Float | Div Expr Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Sqrt Expr

mydiv :: Float -> Float -> Maybe Float
mydiv n m | m == 0 = Nothing
                    | otherwise = Just (n / m)

mymult :: Float -> Float -> Maybe Float
mymult n m = Just (n * m)

mysub :: Float -> Float -> Maybe Float
mysub n m = Just (n - m)

myadd :: Float -> Float -> Maybe Float
myadd n m = Just (n + m)

mysqrt :: Float -> Maybe Float
mysqrt a    | a < 0 = Nothing
            | otherwise = Just (sqrt a)


-- sem usar monads
eval :: Expr -> Maybe Float
eval (Val n) = Just n
eval (Sqrt x) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> (mysqrt n)
eval (Div x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mydiv n m)
eval (Mul x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mymult n m)
eval (Add x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (myadd n m)
eval (Sub x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mysub n m)


-- usando bind ( >>= )
evalmonad :: Expr -> Maybe Float
evalmonad (Val n) = return n
evalmonad (Sqrt x) = evalmonad x >>=
                    (\a -> (mysqrt a))
evalmonad (Div x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mydiv n m))
evalmonad (Add x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (myadd n m))
evalmonad (Sub x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mysub n m))
evalmonad (Mul x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mymult n m))


-- usando expressao 'do'
evalfinal :: Expr -> Maybe Float
evalfinal (Val n) = return n
evalfinal (Sqrt x) = do
                    n <- evalfinal x
                    mysqrt n
evalfinal (Div x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mydiv n m

evalfinal (Add x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    myadd n m

evalfinal (Sub x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mysub n m

evalfinal (Mul x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mymult n m


main = do
    -- print (mydiv 5 0) --nothing (divisao por zero)
    -- print (eval (Div (Val 5) (Val 0))) --nothing (divisao por zero)
    -- print (eval (Div (Val 5) (Val 2))) -- just 2 (divisao Floateira de 5 por 2)
    -- print (evalmonad (Div (Val 5) (Val 0))) --nothing (divisao por zero)
    -- print (evalmonad (Div (Val 5) (Val 2))) -- just 2 (divisao Floateira de 5 por 2)
    -- print (evalfinal (Div (Val 5) (Val 0))) --nothing (divisao por zero)
    -- print (evalfinal (Div (Val 5) (Val 2))) -- just 2 (divisao Floateira de 5 por 2)
    -- print (evalfinal (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3))) -- = ((28+2)/(6-1)) * 3 = 18
    
    -- sqrt(3-4) = sqrt(-1) = erro -> Nothing
    print (mysqrt (-1))
    print (eval (Sqrt(Sub (Val 3) (Val 4))))
    print (evalmonad (Sqrt(Sub (Val 3) (Val 4))))
    print (evalfinal (Sqrt(Sub (Val 3) (Val 4))))

    --sqrt((3*8)+1) = sqrt(25) = 5
    print (mysqrt 25)
    print (eval (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))
    print (evalmonad (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))
    print (evalfinal (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))

    -- sqrt(0) = 0
    print (mysqrt 0)
    print (eval (Sqrt (Val 0)))
    print (evalmonad (Sqrt (Val 0)))
    print (evalfinal (Sqrt (Val 0)))
