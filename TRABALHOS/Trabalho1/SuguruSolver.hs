{-# LANGUAGE BlockArguments #-}

module SuguruSolver(fillAreas1, getPossibilitiesArea, getPossibilitiesMatrix,
                    clearPossibilities, checkSurroundings, countPossibilities,
                    countLackingCells, clearBoard, parsePossibilitiesToSuguru
                    ) where

    import Matrix
    import Data.List -- (delete 10 [0,0,10] removes the 10 ; delete 2 [0,1,10] does nothing without error)

    {- Fill all the areas that have size 1 with the number 1 (just that possibility)-}
    fillAreas1 :: [[(Int,Int)]] -> [[Int]] -> [[Int]]
    fillAreas1 [] m = m
    fillAreas1 (x:y) (a:b) = 
        if length x == 1 then
            fillAreas1 y (put (a:b) (x!!0) 1)
        else
            fillAreas1 y (a:b)
    
    {- returns a 3d matrix with all the possibilites of numbers for each cell, using the size of the area;
    -> calls getPossibilitiesArea for each area of the board
    !!! not final possibilities, only fills with array of [1 -> size], but doesnt see if any other cell is already filled
    getPossibilitiesMatrix :: board          -> suguru  -> R: matriz de possibilidades-}
    getPossibilitiesMatrix :: [[(Int, Int)]] -> [[Int]] -> [[[Int]]]
    getPossibilitiesMatrix [] _ = []
    getPossibilitiesMatrix (x:y) matriz =
        (getPossibilitiesArea x matriz ((length x)-1) (length x)) : (getPossibilitiesMatrix y matriz)

    {-returns a 2d matrix, containing an array of possibilites for each cell in the received area
    !!! same of the getPossibilitiesMatrix applies here
    getPossibilitiesArea :: board        -> suguru  -> loopCount -> tamanhoarea -> R: matriz de possibilidades -}
    getPossibilitiesArea :: [(Int, Int)] -> [[Int]] -> Int       -> Int          -> [[Int]]
    getPossibilitiesArea _ _ (-1) _ = []
    getPossibilitiesArea (l1:l2) matriz n tamanhoArea = 
        if (matriz!!((fst l1)-1))!!((snd l1)-1) == 0 then
            -- fills with [1..length area]
            [1..tamanhoArea] : (getPossibilitiesArea l2 matriz (n-1) tamanhoArea)
        else
            -- adds a list with only one element, the one possibility
            [(matriz!!((fst l1)-1))!!((snd l1)-1)] : (getPossibilitiesArea l2 matriz (n-1) tamanhoArea)
    

    {- runs through each area, removing from the possibilities the numbers that
    are already present in that area
    clearPossibilities :: possibilites  -> possibilities -}
    clearPossibilities ::   [[[Int]]]   ->   [[[Int]]]
    clearPossibilities [] = []
    clearPossibilities (a:b) = (clearArea a (length a) 0) : (clearPossibilities b)

    {-
    clearArea :: possibilities of area -> area size  -> loop -> possibilites-}
    clearArea ::      [[Int]]         ->     Int     ->  Int ->  [[Int]]
    clearArea pos size loop =
        if loop == size then pos
        else 
            if length (pos!!loop) == 1 then
                -- if the possibilities for that cell is only one (already correct) then remove this number from all the OTHER cells
                clearArea (removeNumberFromOtherCells pos ((pos!!loop)!!0) loop size 0) size (loop+1)
            else
                -- if not, keep this cell intact and continue
                clearArea pos size (loop+1)
    
    {-
    removeNumberFromOtherCells ::  cells  -> number -> index to dont change -> area size -> loop count -> cells  -}
    removeNumberFromOtherCells :: [[Int]] ->   Int  ->          Int         ->    Int    ->     Int    -> [[Int]]
    removeNumberFromOtherCells area n idx size count = 
        if count == size then []
        else
            if count == idx then
                area!!count : removeNumberFromOtherCells area n idx size (count+1)
            else
                (delete n (area!!count)) : (removeNumberFromOtherCells area n idx size (count+1))

---------------------------------------------------------------------------------------------------------------------------------------------

    -- {-
    -- Element places example
    -- ------------------------------------
    -- |           |          |           |
    -- |upper left |  upper   |upper right|
    -- |           |  central |           |
    -- ------------------------------------
    -- |           |          |           |
    -- |left wall  |  central |right wall |
    -- |    -      |     -    |      -    |
    -- ------------------------------------
    -- |     -     |     -    |     -     |
    -- |   lower   |   lower  |  lower    |
    -- |   left    |  central |   right   |
    -- ------------------------------------

    {- A CHECAGEM DOS VALORES VAI SER FEITA DA SEGUINTE MANEIRA:
        USANDO A MATRIZ DE AREAS, A DE POSSIBILIDADES E A SUGURU, PRIMEIRO PEGAREMOS O ELEMENTO n
        DA MATRIZ DE ÁREAS (que retorna um index (x,y) ) E USAREMOS ESSE INDEX PARA CHECAR
        OS ELEMENTOS EM VOLTA DESSA CELULA NO SUGURU. checaremos (x-1,y-1), (x-1,y), (x-1,y+1) e etc
        CASO ALGUM DESSES VALORES NA SUGURU SEJA DIFERENTE DE 0, TIRAREMOS O VALOR DO ELEMENTO
        n DA MATRIZ DE POSSIBILIDADES
    -}

    --checkSurroundings      areas      ->  possibililidades  ->   suguru    ->    possibilidade atualizada
    clearBoard :: [[(Int, Int)]] ->     [[[Int]]]      ->    [[Int]]  ->           [[[Int]]] 
    clearBoard areas possibilidades suguru = do
        let poss2 = checkSurroundings areas (clearPossibilities possibilidades) suguru 0
        if (possibilidades == poss2) then
            poss2
        else

            clearBoard areas poss2 suguru


    --checkSurroundings        areas    ->    possibilidades ->    suguru   -> idxArea ->    possibilidades
    checkSurroundings :: [[(Int, Int)]] ->     [[[Int]]]     ->    [[Int]]  ->  Int    ->      [[[Int]]] 
    checkSurroundings areas possibilidades suguru idxArea = do
        if idxArea == (length areas) then
            []
        else
            (checkArea (areas!!idxArea) (possibilidades!!idxArea) idxArea 0 suguru) : (checkSurroundings areas possibilidades suguru (idxArea+1))

    --checkArea      area     -> possibilidadesArea -> idxArea -> idxElem -> suguru  -> possibilidadesArea
    checkArea :: [(Int, Int)] ->     [[Int]]        ->   Int   ->   Int   -> [[Int]] ->       [[Int]]
    checkArea area possibilidade idxArea idxElem suguru = 
        if idxElem == (length area) then do
            []
        else do
            let x = (fst (area!!idxElem)) - 1
            let y = (snd (area!!idxElem)) - 1
            if x == 0 then do
                if y == 0 then do
                    -- UPPER LEFT
                    let x1 = delete ((suguru!!x)!!(y+1)) (possibilidade!!idxElem)
                    let x2 = delete ((suguru!!(x+1))!!(y+1)) x1
                    let xf = delete ((suguru!!(x+1))!!y) x2
                    xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

                else do
                    if y == ((length (suguru!!0))-1) then do
                        -- UPPER RIGHT
                        
                        let x1 = delete ((suguru!!(x))!!(y-1)) (possibilidade!!idxElem)
                        let x2 = delete ((suguru!!(x+1))!!(y-1)) x1
                        let xf = delete ((suguru!!(x+1))!!(y)) x2
                        xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

                    else do
                        -- UPPER CENTRAL
                        let x1 = delete ((suguru!!(x))!!(y+1)) (possibilidade!!idxElem)
                        let x2 = delete ((suguru!!(x+1))!!(y+1)) x1
                        let x3 = delete ((suguru!!(x+1))!!(y)) x2
                        let x4 = delete ((suguru!!(x+1))!!(y-1)) x3
                        let xf = delete ((suguru!!(x))!!(y-1)) x4
                        xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

            else do -- nao é primeira linha
                if x == ((length (suguru!!0))-1) then do -- ultima linha
                    if y == 0 then do
                        -- LOWER LEFT
                        let x1 = delete ((suguru!!(x-1))!!(y)) (possibilidade!!idxElem)
                        let x2 = delete ((suguru!!(x-1))!!(y+1)) x1
                        let xf = delete ((suguru!!(x))!!(y+1)) x2
                        xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

                    else do
                        if y == ((length (suguru!!0))-1) then do
                            -- LOWER RIGHT
                            let x1 = delete ((suguru!!(x-1))!!(y)) (possibilidade!!idxElem)
                            let x2 = delete ((suguru!!(x-1))!!(y-1)) x1
                            let xf = delete ((suguru!!(x))!!(y-1)) x2
                            xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

                        else do
                            -- LOWER CENTRAL
                            let x1 = delete ((suguru!!(x-1))!!(y-1)) (possibilidade!!idxElem)
                            let x2 = delete ((suguru!!(x-1))!!(y)) x1
                            let x3 = delete ((suguru!!(x-1))!!(y+1)) x2
                            let x4 = delete ((suguru!!(x))!!(y-1)) x3
                            let xf = delete ((suguru!!(x))!!(y+1)) x4
                            xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)
                            
                else do-- linhas do meio
                    if y == 0 then do
                        -- LEFT WALL
                        let x1 = delete ((suguru!!(x-1))!!(y+1)) (possibilidade!!idxElem)
                        let x2 = delete ((suguru!!(x-1))!!(y)) x1
                        let x3 = delete ((suguru!!(x))!!(y+1)) x2
                        let x4 = delete ((suguru!!(x+1))!!(y)) x3
                        let xf = delete ((suguru!!(x+1))!!(y+1)) x4
                        xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)
                    else do
                        if y == ((length (suguru!!0))-1) then do
                            -- RIGHT WALL
                            let x1 = delete ((suguru!!(x-1))!!(y)) (possibilidade!!idxElem)
                            let x2 = delete ((suguru!!(x-1))!!(y-1)) x1
                            let x3 = delete ((suguru!!(x))!!(y-1)) x2
                            let x4 = delete ((suguru!!(x+1))!!(y-1)) x3
                            let xf = delete ((suguru!!(x+1))!!(y)) x4
                            
                            xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)

                        else do
                            -- CENTRAL
                            let x1 = delete ((suguru!!(x-1))!!(y)) (possibilidade!!idxElem)
                            let x2 = delete ((suguru!!(x-1))!!(y-1)) x1
                            let x3 = delete ((suguru!!(x))!!(y-1)) x2
                            let x4 = delete ((suguru!!(x+1))!!(y-1)) x3
                            let x5 = delete ((suguru!!(x+1))!!(y)) x4
                            let x6 = delete ((suguru!!(x-1))!!(y+1)) x5
                            let x7 = delete ((suguru!!(x))!!(y+1)) x6
                            let xf = delete ((suguru!!(x+1))!!(y+1)) x7
                            xf : (checkArea area possibilidade idxArea (idxElem+1) suguru)
    
    {-
    Counts how many possibilities are there in the board
    -}
    countPossibilities :: [[[Int]]] -> Int -> Int -> Int
    countPossibilities poss i count = do
        if i == (length (poss)-1) then
            count
        else
            (countPossibilitiesArea poss i 0 0) + (countPossibilities poss (i+1) count)


    countPossibilitiesArea :: [[[Int]]] -> Int -> Int -> Int -> Int
    countPossibilitiesArea poss a x count = do
        if x == (length (poss!!a)) then
            count
        else
            if (length ((poss!!a)!!x)) /= 1 then
                countPossibilitiesArea poss a (x+1) (count + (length ((poss!!a)!!x)))
            else
                countPossibilitiesArea poss a (x+1) count
    {-
    Counts how many empty cells are there
    -}
    countLackingCells :: [[[Int]]] -> Int -> Int -> Int
    countLackingCells poss i count = do
        if i == (length (poss)-1) then
            count
        else
            (countLackingCellsInArea poss i 0 0) + (countLackingCells poss (i+1) count)


    countLackingCellsInArea :: [[[Int]]] -> Int -> Int -> Int -> Int
    countLackingCellsInArea poss a x count = do
        if x == (length (poss!!a)) then
            count
        else
            if (length ((poss!!a)!!x)) /= 1 then
                countLackingCellsInArea poss a (x+1) (count + 1)
            else
                countLackingCellsInArea poss a (x+1) count

--  parsePossibilitiesToSuguru :: poss -> board -> sugZeros -> count -> suguru
    parsePossibilitiesToSuguru :: [[[Int]]] -> [[(Int, Int)]] -> [[Int]] -> Int -> [[Int]]
    parsePossibilitiesToSuguru [] [] sug _ = sug
    parsePossibilitiesToSuguru (a:b) (x:y) sug count = do
        if count == (length sug) * (length (sug!!0)) then
            sug
        else 
            parsePossibilitiesToSuguru b y ((parseAreaToSuguru a x sug 0)) (count+1)
    
    parseAreaToSuguru :: [[Int]] -> [(Int, Int)] -> [[Int]] -> Int -> [[Int]]
    parseAreaToSuguru areapos areaboard sug x = do
        if x == length areapos then
            sug
        else
            if (length (areapos!!x)) == 1 then do
                let newsug = put sug (areaboard!!x) ((areapos!!x)!!0)
                parseAreaToSuguru areapos areaboard newsug (x+1)
            else
                parseAreaToSuguru areapos areaboard sug (x+1)