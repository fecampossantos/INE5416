defun add (i lista)
    (if (null lista)
        (cons i ())
        (if (<= i (car lista))
            (cons i lista)
            (cons (car lista) (add i (cdr lista)))
        )
    )
)

(defun ordena (lista)
    (if (null lista)
        ()
        (add (car lista) (ordena (cdr lista)))
    )
)

(defun menor (lista)
    (if (null lista)
        0
        (car (ordena lista))
    )
)

(defun getUltimo (i lista)
    (if (null lista)
        i
        (getUltimo (car lista) (cdr lista))
    )
)

(defun maior (lista)
    (if (null lista)
        0
        (getUltimo (car (ordena lista)) (cdr (ordena lista)))
    )
)

(defun diferencaMaiorMenor (lista)
    (if (null lista)
        0
        (- (maior lista) (menor lista))
    )
)

(defun main()
    (write (diferencaMaiorMenor (list 10 5 9 8)))
)

(main)