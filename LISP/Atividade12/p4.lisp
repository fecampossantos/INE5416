(defun add (i lista)
    (if (null lista)
        (cons i ())
        (if (<= i (car lista))
            (cons i lista)
            (cons (car lista) (add i (cdr lista)))
        )
    )
)

(defun ordenacao (lista)
    (if (null lista)
        ()
        (add (car lista) (ordenacao (cdr lista)))
    )
)

(defun menor (lista)
    (if null lista)
        0
        (car (ordenacao (lista)))

    )
)

(defun maior (lista)
   (if null lista)
        0
        (cdr (ordenacao (lista)))

    )
)

(defun comprimento (lista)
    (if (null lista) ;testa se lista é vazia
        0
        (+ 1 (comprimento (cdr lista))) ;cdr retorna cauda
    )
)

(defun diferencaMaiorMenor (lista)
    (if (null lista)
        0
        (- (maior lista) (menor lista))
    )


)

(defun main()
    (write (diferencaMaiorMenor (list 1 2 3 4)))
)

(main)
