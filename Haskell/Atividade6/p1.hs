--ghc 8.0.2

type Nome = String
type Disciplina = String
type Notas = [Float]

type Aluno = (Nome, Disciplina, Notas)

alunos :: [(Nome, Disciplina, Notas)]
alunos = [("Felipe", "Paradigmas", [6.0, 7.0, 8.0]), ("Karina", "Organizacional", [9.0, 10.0, 8.0]), ("Pietro", "Culinaria", [6.0, 2.0, 4.0]), ("Clara", "Administração", [7.0, 7.0, 8.0]), ("Max", "blablalba", [1.0, 2.0, 3.0])]


getAluno :: Int -> Aluno
getAluno n = alunos!!(n-1)

getNome :: Aluno -> String
getNome (nome, _, _) = nome

getNotas :: Aluno -> [Float]
getNotas (_, _, notas) = notas

calculaMedia :: [Float] -> Float
calculaMedia [a, b, c] = (a+b+c)/3

getMedia :: Int -> Float
getMedia i = calculaMedia (getNotas(getAluno i))

getSomaNotasTurma :: Int -> Float
getSomaNotasTurma 6 = 0
getSomaNotasTurma n = getSomaNotas(getNotas(getAluno n)) + getSomaNotasTurma n+1

getSomaNotas :: [Float] -> Float
getSomaNotas [a, b, c] = a + b + c

getSomaMediasTurma :: Int -> Float
getSomaMediasTurma 6 = 0.0
getSomaMediasTurma n = getMedia n + getSomaMediasTurma (n+1)

getMediaTurma :: Int -> Float
getMediaTurma n = (getSomaMediasTurma n)/5.0

main = do
    print(getAluno 2)
    print(getNome( getAluno 1 ))
    print(getMedia 1)
    
    print(getMediaTurma 1)