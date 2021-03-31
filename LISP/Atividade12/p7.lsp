(defun enesimo (lista)
    (if (null lista)
        0
        (enesimoAux lista 10)
    )
)

(defun enesimoAux (lista x)
    (if (null lista)
        "A lista deve ter pelo menos 10 elementos!"
        (if (= 1 x)
            (car lista)
            (enesimoAux (cdr lista) (- x 1))
        )
    )
)

(defun main()
    (write-line (write-to-string (enesimo (list 1 2 3 4 5 6 7 8 9 10))))
    (write-line (write-to-string (enesimo (list 1 2 3 4 5 6 7))))
    (write-line (write-to-string (enesimo (list 10 9 8 7 6 5 4 3 2 1))))
    (write-line (write-to-string (enesimo (list 1 2 3 4 5 6 7 8 9))))

)

(main)