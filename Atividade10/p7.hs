{-
Crie uma fun¸c˜ao escreva :: String -> Int -> IO (), a qual recebe como parˆametros uma string e
um inteiro n e imprime na tela os n primeiros caracteres da string. Para imprimir cada caracter, utilize
a fun¸c˜ao putChar. N˜ao crie nenhuma fun¸c˜ao auxiliar e nem altere os parˆametros da fun¸c˜ao escreva. Crie
uma vers˜ao usando >>= e outra usando a nota¸c˜ao do
-}

escreva :: String -> Int -> IO ()
escreva (a:b) 1 = putChar a
escreva (a:b) n = putChar a >> escreva b (n-1)

escrevaDo :: String -> Int -> IO ()
escrevaDo (a:b) 1 = putChar a
escrevaDo (a:b) n = do
    putChar a
    escrevaDo b (n-1)

main = do
    escreva "felipe" 3
    print()
    print()
    escrevaDo "felipe" 3
