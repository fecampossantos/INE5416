(defun inverte (lista)
    (inverteAux lista ())
)

(defun inverteAux (lista a)
    (if (null lista)
        a
        (inverteAux (cdr lista) (cons (car lista) a))
    )
)

(defun main()
    (write-line (write-to-string (inverte (list 1 2 3 4 5 6 7))))
)

(main)