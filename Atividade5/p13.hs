apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto f (a:b)
    | f a == True = apagarEnquanto f b
    | f a /= True = (a:b)

main = do
    let lista = [1,3,5,7,2,5,7,8,9]
    print(apagarEnquanto odd lista) -- retorna [2,5,7,8,9]