{-
1. Altere o exemplo visto em sala sobre a opera¸c˜ao Div para suportar tamb´em as opera¸c˜oes Mul Expr Expr
(para multiplica¸c˜ao), Add Expr Expr (para soma) e Sub Expr Expr (para subtra¸c˜ao). Assim, sua solu¸c˜ao
deve suportar express˜oes como (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)). Fa¸ca
as modifica¸c˜oes necess´arias nas fun¸c˜oes de avalia¸c˜ao criadas e crie ao menos trˆes exemplos de express˜oes
para testar sua solu¸c˜ao. As modifica¸c˜oes devem ser feitas nas trˆes formas de criar esta fun¸c˜ao vistas em
sala de aula (sem usar monads, usando >>= e usando a nota¸c˜ao do. N˜ao preocupe-se com precedˆencia
de operadores. Qual forma foi mais f´acil de dar manuten¸c˜ao? E mais dif´ıcil?
-}

data Expr = Val Int | Div Expr Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr

mydiv :: Int -> Int -> Maybe Int
mydiv n m | m == 0 = Nothing
                    | otherwise = Just (n `div` m)

mymult :: Int -> Int -> Maybe Int
mymult n m = Just (n * m)

mysub :: Int -> Int -> Maybe Int
mysub n m = Just (n - m)

myadd :: Int -> Int -> Maybe Int
myadd n m = Just (n + m)


-- sem usar monads
eval :: Expr -> Maybe Int
eval (Val n) = Just n
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
evalmonad :: Expr -> Maybe Int
evalmonad (Val n) = return n
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
evalfinal :: Expr -> Maybe Int
evalfinal (Val n) = return n
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
    -- print (eval (Div (Val 5) (Val 2))) -- just 2 (divisao inteira de 5 por 2)
    -- print (evalmonad (Div (Val 5) (Val 0))) --nothing (divisao por zero)
    -- print (evalmonad (Div (Val 5) (Val 2))) -- just 2 (divisao inteira de 5 por 2)
    -- print (evalfinal (Div (Val 5) (Val 0))) --nothing (divisao por zero)
    -- print (evalfinal (Div (Val 5) (Val 2))) -- just 2 (divisao inteira de 5 por 2)
    --print (evalfinal (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3))) -- = ((28+2)/(6-1)) * 3 = 18
    
    -- (2 + 15)*(((5+7) / 4) - 3) = 0 (multiplicacao por zero)
    print (evalfinal (Mul (Add (Val 15) (Val 2)) (Sub (Div (Add (Val 5) (Val 7)) (Val 4)) (Val 3)))) 
    print (eval (Mul (Add (Val 15) (Val 2)) (Sub (Div (Add (Val 5) (Val 7)) (Val 4)) (Val 3))))
    print (evalmonad (Mul (Add (Val 15) (Val 2)) (Sub (Div (Add (Val 5) (Val 7)) (Val 4)) (Val 3))))

    -- ((((2 + 2) + 2) + 2 ) * 7) = 56
    print (eval (Mul (Add (Add (Add (Val 2) (Val 2)) (Val 2)) (Val 2)) (Val 7)))
    print (evalmonad (Mul (Add (Add (Add (Val 2) (Val 2)) (Val 2)) (Val 2)) (Val 7)))
    print (evalfinal (Mul (Add (Add (Add (Val 2) (Val 2)) (Val 2)) (Val 2)) (Val 7)))

    -- ((((5-3)*7)*2)-20) = 8
    print (eval (Sub (Mul (Mul (Sub (Val 5) (Val 3)) (Val 7)) (Val 2)) (Val 20)))
    print (evalmonad (Sub (Mul (Mul (Sub (Val 5) (Val 3)) (Val 7)) (Val 2)) (Val 20)))
    print (evalfinal (Sub (Mul (Mul (Sub (Val 5) (Val 3)) (Val 7)) (Val 2)) (Val 20)))


{- Qual forma foi mais facil de dar manutencao? E mais dificil?
-- A mais fácil foi usando a notação DO e a mais difícil foi usando bind, principalmente
-- pelo costume que tenho que programar sequencialmente
-}