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
(defun main()
    (write-line (write-to-string (menor (list 1 2 3 4))))
)

(main)
