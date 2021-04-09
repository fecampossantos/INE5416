
(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8))) ;inicializando a matriz com alguns valores
)

(defun maior(a) 
    (setq m (aref a 0 0)) ;aref permite acessar uma posição i j da matriz, neste caso acesso a posição 0,0 da matriz a
    (dotimes (i 3) ;dotimes permite realizar um número fixo de iterações
        (dotimes (j 3)
            (if (> (aref a i j) m)
                (setq m (aref a i j))
            )
        )
    )
    m ;é o retorno da minha função
)

(defun ehMagico (lista n)
    (if (de1an2 lista n)
        (if (somaLinhas lista n)
            (if (somaColunas lista n)
                (if (= (diagonalPrincipal lista n) (diagonalSecundaria lista n))
                    T
                    NIL
                )
                NIL
            )
            NIL
        )
        NIL
    )
)

(defun criaListaN2 (n)
    (criaLista 1 (* n n))
)

(defun criaLista (i n)
    (if (= i n)
        ()
        (cons i (criaLista (+ i 1) n))
    )
)

(defun de1an2 (lista n)
    
)

(defun somaLinhas (lista n)

)

(defun somaColunas (lista n)

)

(defun diagonaPrincipal (lista n)

)

(defun diagonalSecundaria (lista n)

)

(defun main()
    ;; (write-line (write-to-string x)) ;imprimindo uma matriz
    
    ;; (write-line (write-to-string (aref x 0 0)))
    ;; (write-line (write-to-string (aref x 1 1)))
    
    ;; (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro
    
    ;; (setf (aref x 0 1) 33) ;alrerando o elemento da posição 0,1 para 33
    
    ;; (write-line (write-to-string (maior x)))
)


(main)