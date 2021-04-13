(defun fatia (lista n m)
    (fatiaAux lista n m 1)
)

(defun fatiaAux (lista n m x)
    (if (< x n)
        (fatiaAux (cdr lista) n m (+ x 1))
        (if (= x m)
            ()
            (cons (car lista) (fatiaAux (cdr lista) n m (+ x 1)))
        )
    )
)

(defun main()
    (write-line (write-to-string (fatia (list 1 2 3 4 5 6 7 8 9 10) 1 3)))
    (write-line (write-to-string (fatia (list 1 2 3 4 5 6 7) 4 5)))
    (write-line (write-to-string (fatia (list 10 9 8 7 6 5 4 3 2 1) 2 10)))
    (write-line (write-to-string (fatia (list 1 2 3 4 5 6 7 8 9) 5 7)))

)

(main)