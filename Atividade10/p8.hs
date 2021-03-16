{-
8. Crie uma fun¸c˜ao echo :: IO (), a qual lˆe um caracter e simplesmente o imprime na tela. N˜ao crie
nenhuma fun¸c˜ao auxiliar e nem altere os parˆametros da fun¸c˜ao escreva. Crie uma vers˜ao usando >>= e
outra usando a nota¸c˜ao do.
-}

echoDo :: IO ()
echoDo = do
    l <- getLine
    putStr l

echo :: IO ()
echo = getLine >>= putStr

main = do
    echo