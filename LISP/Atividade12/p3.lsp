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
    (if (null lista)
        0
        (car (ordenacao lista))
    )
)

(defun main()
    (write (menor (list 1 5 7 6)))
)

(main)
