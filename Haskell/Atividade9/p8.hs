import Data.List

data Matrix = Matrix [[Int]]
data Position = Position (Int, Int)

sumMatrix :: [[Int]] -> Int
sumMatrix m = sumMatrixAux m ((length m) - 1)

sumMatrixAux :: [[Int]] -> Int -> Int
sumMatrixAux m 0 = sum (m!!0)
sumMatrixAux m n = (sum (m!!n)) + (sumMatrixAux m (n-1))

sumMatrixes :: [[Int]] -> [[Int]] -> [[Int]]
sumMatrixes [] [] = []
sumMatrixes (a:at) (b:bt) = zipWith (+) a b : sumMatrixes at bt --realiza o zip (pegar um elemento de cada lista) somando os dois elementos das listas a e b

checkQuadrada :: [[Int]] -> Bool
checkQuadrada m = 
    if length (m!!0) == length m then True
    else False

somaLinhasIgual :: [[Int]] -> Bool
somaLinhasIgual m = somaLinhasIgualAux m ((length m)-1)

somaLinhasIgualAux :: [[Int]] -> Int -> Bool
somaLinhasIgualAux m 1 = sum (m!!1) == sum(m!!0)
somaLinhasIgualAux m n = 
    if(sum (m!!n) == sum(m!!(n-1))) then
        somaLinhasIgualAux m (n-1)
    else False

somaColunasIgual :: [[Int]] -> Bool
somaColunasIgual m = somaLinhasIgualAux (transpoe m) ((length m)-1)

transpoe :: [[Int]] -> [[Int]]
transpoe ([]:_) = []
transpoe m = (map head m) : transpoe (map tail m)

somaDiagonalPrimaria :: [[Int]] -> Int
somaDiagonalPrimaria m = somaDiagonalPrimariaAux m ((length m)-1)

somaDiagonalPrimariaAux :: [[Int]] -> Int -> Int
somaDiagonalPrimariaAux m 0 = ((m!!0)!!0)
somaDiagonalPrimariaAux m n = ((m!!n)!!n) + (somaDiagonalPrimariaAux m (n-1))

somaDiagonalSecundaria :: [[Int]] -> Int
somaDiagonalSecundaria m = somaDiagonalSecundariaAux m ((length m)-1) 0

somaDiagonalSecundariaAux :: [[Int]] -> Int -> Int -> Int
somaDiagonalSecundariaAux m 0 c= ((m!!0)!!c)
somaDiagonalSecundariaAux m l c = ((m!!l)!!c) + (somaDiagonalSecundariaAux m (l-1) (c+1))

checkSomaLinhasColunas :: [[Int]] -> Bool
checkSomaLinhasColunas m = (somaColunasIgual m) && (somaColunasIgual m)

checkSomaDiagonais :: [[Int]] -> Bool
checkSomaDiagonais m = (somaDiagonalSecundaria m) == (somaDiagonalPrimaria m)


formadaUmAN :: [[Int]] -> Bool
formadaUmAN mat = formadaUmANAux mat ((length mat)-1) ((length mat)-1) [1..(length mat)*(length mat)]    

formadaUmANAux :: [[Int]] -> Int -> Int -> [Int] -> Bool
formadaUmANAux _ _ _ [] = True
formadaUmANAux mat row col auxList =
    if (row<0) || (col<0) then False
    else
        if (mat!!row)!!col `elem` auxList then
            if col==0 then
                formadaUmANAux mat (row-1) ((length (mat!!row))-1) (delete ((mat!!row)!!col) auxList)
            else
                formadaUmANAux mat row (col-1) (delete ((mat!!row)!!col) auxList)
        else False


-- delete :: Int -> [Int] -> [Int]
-- delete _ [] = []
-- delete x (y:ys)
--         | x == y = delete x ys
--         | otherwise = y : delete x ys

checkMagica :: [[Int]] -> [Char]
checkMagica m = 
    if (formadaUmAN m) then
        if (checkQuadrada m) then
            if(checkSomaDiagonais m) then
                if(checkSomaLinhasColunas m) then
                    "A matriz e um quadrado magico!"
                else "A soma das linhas e colunas e diferente"
            else "A soma das diagonais e diferente"
        else "A matriz nao e quadrada"
    else "A matriz nao e formada por elementos de 1 a n^2"

isPermutacao :: [[Int]] -> Bool
isPermutacao m = checkPermutacaoLinhas m ((length m)-1) ((length m)-1) (1 : (take ((length m)-1) (repeat 0)))

checkPermutacaoLinhas :: [[Int]] -> Int -> Int -> [Int] -> Bool
checkPermutacaoLinhas m l c list = 
    if l<0 then
        True
    else
        if ((m!!l)!!c) `elem` list then
            if c==0 then
                checkPermutacaoLinhas m (l-1) ((length (m!!l))-1) (1 : (take ((length m)-1) (repeat 0)))
            else
                checkPermutacaoLinhas m l (c-1) (delete ((m!!l)!!c) list)
        else
            False

main = do
    let matrix1 = [[1,2,3], [4,5,6], [7,8,9]]
    let matrix2 = [[11,12,13], [14,15,16], [17,18,19]]
    let matrix3 = [[1,2],[3,4]]
    let matrix4 = [[9,8], [7,6]]
    let matrix5 = [[9,8], [7,6], [5,4]]
    let matrix6 = [[1,3],[2,2]]
    let magic = [[2,7,6], [9,5,1], [4,3,8]]
    let notmagic = [[2,2,2], [1,2,3], [1,1,4]]
    let notmagic2 = [[1,10,1], [1,1,1], [1,0,1]]
    let matPermut = [[1,0,0], [0,0,1], [0,1,0]]

    print(isPermutacao matPermut)
    
