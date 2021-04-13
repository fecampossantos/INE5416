{- O método check verifica se exitem casas próximas com elementos iguais -}
{- Os métodos auxiliares apenas servem para manter o método check pequeno  -}
{- Nenhum método auxiliar deve ser modificado -}

module Check (check) where

{-
checkAux1 :: Int -> Int -> [[Int]] -> Bool
checkAux1 lin col matrix =
  if (matrix!!lin!!col /= 0) then
    if ((matrix!!lin!!col) == (matrix!!lin!!(col+1))) then
      False
    else if (col > 0) && ((matrix!!lin!!col) == (matrix!!(lin+1)!!(col-1))) then
      False
    else if ((matrix!!lin!!col) == (matrix!!(lin+1)!!(col))) then
      False
    else if ((matrix!!lin!!col) == (matrix!!(lin+1)!!(col+1))) then
      False
    else
      check lin (col+1) matrix
  else
    check lin (col+1) matrix

checkAux2 :: Int -> Int -> [[Int]] -> Bool
checkAux2 lin col matrix =
  if (matrix!!lin!!col /= 0) then
    if ((matrix!!lin!!col) == (matrix!!(lin+1)!!(col))) then
      False
    else if ((matrix!!lin!!col) == (matrix!!(lin+1)!!(col-1))) then
      False
    else
      check (lin+1) 0 matrix
  else
    check (lin+1) 0 matrix

checkAux3 :: Int -> Int -> [[Int]] -> Bool
checkAux3 lin col matrix =
  if (matrix!!lin!!col /= 0) then
    if (col < ((length (matrix!!0))-1)) then
      if ((matrix!!lin!!col) == (matrix!!lin!!(col+1))) then
        False
      else
        check lin (col+1) matrix
    else
      True
  else
    check lin (col+1) matrix

check :: Int -> Int -> [[Int]] -> Bool
check lin col matrix =
  if lin < ((length matrix)-1) then
    if (col < ((length (matrix!!0))-1)) then
      if (matrix!!lin!!col /= 0) then
        checkAux1 lin col matrix
      else
        check lin (col+1) matrix
    else if (col == ((length (matrix!!0))-1)) then
      if (matrix!!lin!!col /= 0) then
        checkAux2 lin col matrix
      else
        check lin (col+1) matrix
    else
      if (matrix!!lin!!col /= 0) then
        check (lin+1) 0 matrix
      else
        check (lin+1) 0 matrix
  else if lin == ((length matrix)-1) then
    if (matrix!!lin!!col /= 0) then
      checkAux3 lin col matrix
    else
      check lin (col+1) matrix
  else
    True

-}

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

--  check :: linha -> coluna -> suguru -> resultado
    check :: Int -> Int -> [[Int]] -> Bool
    --check 4 4 _ = True
    check lin col suguru = 
        --if (lin == ((length suguru)-1) && col == (length (suguru!!0)-1) )  then do
        --    True
        --else
          if ((suguru!!lin)!!col) == 0 then
            if col == ((length (suguru!!0))-1) then
              check (lin+1) 0 suguru
            else
              check lin (col+1) suguru
          else
            if lin == 0 then
                if col == 0 then
                    -- UPPER LEFT
                    if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) ) then
                      False
                    else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col+1)) ) then
                      False
                    else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) then
                      False
                    else
                      check lin (col+1) suguru

                else
                    if col == ((length (suguru!!0))-1) then
                        -- UPPER RIGHT
                        if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) ) then
                          False
                        else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col-1)) ) then
                          False
                        else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) then
                          False
                        else
                          check (lin+1) 0 suguru

                    else
                        -- UPPER CENTRAL
                        if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) ) then
                          False
                        else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) ) then
                          False
                        else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col-1)) then
                          False
                        else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) then
                          False
                        else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col+1)) then
                          False
                        else
                          check lin (col+1) suguru

            else -- nao é primeira linha
                if lin == ((length (suguru!!0))-1) then -- ultima linha
                    if col == 0 then
                        -- LOWER LEFT
                        if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                          False
                        else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col+1)) ) then
                          False
                        else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) then
                          False
                        else
                          check lin (col+1) suguru

                    else
                        if col == ((length (suguru!!0))-1) then
                            -- LOWER RIGHT
                            if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col-1)) ) then
                              False
                            else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) then
                              False
                            else
                              -- ULTIMA LINHA E ULTIMA COLUNA, FINDOU A MATRIZ
                              True

                        else
                            -- LOWER CENTRAL
                            if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                              False
                            else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col+1)) then
                              False
                            else if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) ) then
                              False
                            else
                              check lin (col+1) suguru
                            
                else-- linhas do meio
                    if col == 0 then
                        -- LEFT WALL
                            if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col+1)) ) then
                              False
                            else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col+1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) ) then
                              False
                            else
                              check lin (col+1) suguru
                    else
                        if col == ((length (suguru!!0))-1) then
                            -- RIGHT WALL
                            if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                              False
                            else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) ) then
                              False
                            else
                              check (lin+1) 0 suguru

                        else
                            -- CENTRAL
                            if( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col)) ) then
                              False
                            else if ((suguru!!(lin))!!(col)) == ((suguru!!(lin-1))!!(col+1)) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin))!!(col+1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col-1)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col)) ) then
                              False
                            else if ( ((suguru!!(lin))!!(col)) == ((suguru!!(lin+1))!!(col+1)) ) then
                              False
                            else
                              check lin (col+1) suguru