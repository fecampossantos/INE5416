import Arvore

main = do
    putStrLn (show (somaElementos minhaArvore))
    putStrLn (show (buscaElemento minhaArvore 30))
    putStrLn (show (buscaElemento minhaArvore 55))
    putStrLn (show (minimoElemento minhaArvore))
    
    print(ocorrenciasElemento minhaArvore 64)
    print(ocorrenciasElemento minhaArvore2 7)
    
    print(maioresQueElemento minhaArvore 15)
    
    print(quantidade minhaArvore)
    
    print(elementos minhaArvore)
    
    print(mediaElementos minhaArvore2)
