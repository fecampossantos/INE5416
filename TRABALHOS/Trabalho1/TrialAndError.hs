module TrialAndError(selectPoss) where
  import Matrix
  import SuguruSolver


  selectPoss :: [[[Int]]] -> [[[Int]]]
  selectPoss [] = []
  selectPoss (a:b) = do
    -- chama o que vai selecionar um elemento de area
    (getPossFromArea a) : b
    -- if check retornar clearboard
    -- else roda getsolution sem aquela possibilidade escolhida acima
    
  getPossFromArea :: [[Int]] -> [[Int]]
  getPossFromArea [] = []
  getPossFromArea (a:b) = do
    if length a /= 1 then
      -- seleciona o elemento 0 de a
      [a!!1] : b
    else
        a : getPossFromArea b
  
  {-
  selectPoss2 :: [[[Int]]] -> [[[Int]]]
  selectPoss2 [] = []
  selectPoss2 (a:b) = do
    -- chama o que vai selecionar um elemento de area
    (getPossFromArea2 a) : (selectPoss2 b)
    -- if check retornar clearboard
    -- else roda getsolution sem aquela possibilidade escolhida acima
  
  getPossFromArea2 :: [[Int]] -> [[Int]]
  getPossFromArea2 [] = []
  getPossFromArea2 (a:b) = do
    if length a /= 1 then
      -- seleciona o elemento 0 de a
      [a!!0] : (getPossFromArea2 b)
    else
        a : getPossFromArea2 b
  -}
        