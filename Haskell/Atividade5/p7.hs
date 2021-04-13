alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

aprovados :: [(Int, String, Float)] -> [String]
aprovados l = map getNome (filteraprovados l)

filteraprovados :: [(Int, String, Float)] -> [(Int, String, Float)]
filteraprovados [] = []
filteraprovados l = filter aprovado l

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 [] = [""]
aprovados2 (a:b)
    | aprovado a = (getNome a) : (aprovados2 b)
    | aprovado a == False = aprovados2 b

aprovado :: (Int, String, Float) -> Bool --(Int, String, Float)
aprovado (a,b,c)
    | c >= 6 = True
    | c < 6 = False

gerarPares :: [t] -> [u] -> [(t,u)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

gerarPares2 :: t -> [u] -> [(t,u)]
gerarPares2 a l = [(a, b) | b <-l]


gerarDuplas :: [t] -> [u] -> [(t,u)]
gerarDuplas _ [] = []
gerarDuplas [] _ = []
gerarDuplas (a:b) (c:d) = (gerarPares2 a d) ++ (gerarDuplas b d)

main = do    
    let duplas = gerarDuplas alunos alunos
    print(duplas)

    