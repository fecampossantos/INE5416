import Matrix
import SuguruSolver
import TrialAndError

main = do

    {-  Aqui são definidas duas matrizes:
        1. A matriz do tabuleiro SUGURU, com os valores preenchidos sendo seus valores e os não preenchidos sendo zero
        2. A matriz de áreas do tabuleiro, com tuplas representando quais células fazem parte daquela área
    -}

    let suguru = [  [1,2,1,0,0,1],
                    [3,0,0,2,5,2],
                    [0,0,0,0,0,0],
                    [1,3,0,0,0,3],
                    [0,0,4,0,5,0],
                    [5,0,0,0,0,2]]
    
    let board = [  [(1,1), (1,2), (2,1), (3,1)],
                    [(1,3), (1,4), (1,5), (2,5), (2,6)],
                    [(1,6)],
                    [(2,2), (2,3), (2,4), (3,3), (3,4)],
                    [(3,2), (4,1), (4,2), (5,1)],
                    [(3,5), (4,5)],
                    [(3,6), (4,6), (5,5), (5,6), (6,6)],
                    [(4,3), (4,4), (5,4), (6,4), (6,5)],
                    [(5,2), (5,3), (6,1), (6,2), (6,3)]
                ]

    {- SOLUÇÃO DO PROGRAMA:
    [
        [[1],[2],[3],[4]],
        [[1],[3,4],[3,4],[5],[2]],
        [[1]],
        [[5],[3,4],[2],[1,4],[3,4]],
        [[2],[1],[3],[4]],
        [[1],[2]],
        [[4],[3],[5],[1],[2]],
        [[5],[3],[1],[2],[4]],
        [[2],[4],[5],[1,3],[1,3]]
    ]
    -}


    {- Aqui o programa checa se existe alguma área de apenas uma celula, e se existir preenche ela com 1 (seu único valor possível)
    -}
    let suguru2 = fillAreas1 board suguru
    -- print(suguru2)
    -- print()
    -- print()
    {- O programa então cria uma nova matriz auxiliar: a matriz de possibilidades. O formato tem a mesma estrutura da de áreas, para
        que seja possível correlacionar os endereços das células das áreas com seus possíveis valores.
        Ex: se o elemento m3x3 da matriz de áreas é (5,7), então a celula s5x7 do tabuleiro pode ter os valores da lista
        l3x3 da matriz de possibilidades.

        Nesse ponto ainda existem valores que não são uma possibilidade nas listas. O que a função faz é pegar o tamanho
        da área e colocar como possibilidades os bounds do tamanho para cada célula. Ex: se a área tem 5 quadrados,
        então seus elementos estão em [1,5]. Mesmo que ja exista o elemento 4 nessa área;
    -}
    let possibilities = getPossibilitiesMatrix board suguru2
    print(possibilities)
    print()
    print()
    {-
    [
        [[1],[2],[3],[1,2,3,4]],
        [[1],[1,2,3,4,5],[1,2,3,4,5],[5],[2]],
        [[1]],
        [[1,2,3,4,5],[1,2,3,4,5],[2],[1,2,3,4,5],[1,2,3,4,5]],
        [[1,2,3,4],[1],[3],[1,2,3,4]],
        [[1,2],[1,2]],
        [[1,2,3,4,5],[3],[5],[1,2,3,4,5],[2]],
        [[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]],
        [[1,2,3,4,5],[4],[5],[1,2,3,4,5],[1,2,3,4,5]]]
    -}
    

    let possibilites_final = clearBoard board possibilities suguru2
    print(possibilites_final)
    print()
    print()
    {-
    [
        [[1],[2],[3],[4]],
        [[1],[3,4],[3,4],[5],[2]],
        [[1]],
        [[4,5],[3,4,5],[2],[1,4,5],[1,3,4]],
        [[2,4],[1],[3],[2,4]],
        [[1],[2]],
        [[1,4],[3],[5],[1,4],[2]],
        [[1,2,5],[1,2,3],[1,2,3],[1,2,3],[1,3,4]],
        [[2],[4],[5],[1,3],[1,3]]
    ]
    -}

  
    let suguruZeros = zeros (length suguru2) (length (suguru2!!0))
    let newpos = selectPoss possibilites_final
    let suguru4 = parsePossibilitiesToSuguru newpos board suguruZeros 0
    let possibilites2 = clearBoard board newpos suguru4
    print(possibilites2)

    {-
    [
        [1],[2],[3],[4]],
        [[1],[3,4],[3,4],[5],[2]],
        [[1]],
        [[5],[3,4],[2],[1,4],[3,4]],
        [[2],[1],[3],[4]],
        [[1],[2]],
        [[4],[3],[5],[1],[2]],
        [[5],[3],[1],[2],[4]],
        [[2],[4],[5],[1,3],[1,3]]
    ]
    -}