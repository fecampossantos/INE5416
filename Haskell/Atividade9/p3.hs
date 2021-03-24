{-
3. Crie uma express˜ao Lambda que compute o n-´esimo n´umero de Fibonacci. Leia n do teclado.
1 1 2 3 5 8 13 21
-}
import Data.Function

fib :: Int -> Int
fib = fix (\f n -> if n <= 2 then 1 else ((f (n-1)) + (f (n-2))))

main = do
    print("Digite n para fib(n)")
    p11 <- getLine
    let p1 = read p11 :: Int
    print(fib p1)