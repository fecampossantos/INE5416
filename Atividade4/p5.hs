media :: Float -> Float -> Float -> Float
media a b c = (a+b+c)/3

resultado :: Float -> String
resultado nota = 
    if nota < 6 then
        "Reprovado"
    else
        "Aprovado"

main = do
    print("Digite as 3 notas do aluno, dando enter a cada nota")
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)
    
    let med = (media a b c)
    print(resultado med)