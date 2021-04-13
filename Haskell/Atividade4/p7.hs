fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

main = do
    print("digite o n fibonacci desejado")
    nString <- getLine
    let n = (read nString :: Int)
    print(fib 6)