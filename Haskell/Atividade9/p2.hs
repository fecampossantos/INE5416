{-
Crie uma expressão Lambda que receba três notas de um aluno (a, b, c), calcule a média e retorne se o
aluno foi aprovado ou reprovado. Para um aluno ser aprovado, ele deve possuir nota igual ou superior a
6. Leia as notas dos alunos do teclado.
-}

apd :: Float -> Float -> Float -> String
apd a b c = 
    if ((\x y z -> (x+y+z)/3) a b c) >= 6 then "Aprovado"
    else "Reprovado"

main = do
    print("Digite as 3 notas do aluno")
    p11 <- getLine
    let p1 = read p11 :: Float
    p21 <- getLine
    let p2 = read p21 :: Float
    p31 <- getLine
    let p3 = read p31 :: Float
    print(apd p1 p2 p3)