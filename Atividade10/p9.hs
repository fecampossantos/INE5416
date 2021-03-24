{-9. Pesquise sobre o Monad Either dispon´ıvel no Haskell. Fa¸ca um pequeno exemplo e explique o seu
funcionamento.
-}

{-Either é utilizado em Haskell para lidar com erros. Ele pode assumir dois tipos: Left ou Right, sendo que
para error handling, se for um Left se assume que é um erro e se for um Right se assume que a função retornou
com sucesso (uma brincadeira já que right em ingles significa "direita" e "certo"-}

-- formato -> data Either a b = Left a | Right b

import Data.Either

divideValues :: Float -> Float -> Either String Float
divideValues _ 0 = Left "Divisao por zero!"
divideValues a b = Right (a/b)

main = do
    print (divideValues 10 5)
    print (divideValues 10 0)