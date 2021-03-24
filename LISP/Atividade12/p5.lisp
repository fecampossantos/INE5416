(defun filter (f lista)
    (if (null lista)
        ()
        (if (funcall f (car lista))
            T
            (filtrar f (cdr lista))
        )
    )
)

(defun eqls (x y)
    (if (= x y)
        T
        NIL
    )
)

(defun busca (lista x)
    (if (filter (eqls x (car lista)) lista)
        "se encontra na lista"
        "nao se encontra na lista"
    )
)

(defun main()
    (write (busca (list 1 2 3 4) 2))
)

(main)
