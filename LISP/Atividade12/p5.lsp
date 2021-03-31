(defun busca (lista x)
    (if (null lista)
        NIL
        (if (= (car lista) x)
            T
            (busca (cdr lista) x)
        )
    )
)

(defun main()
    (write-line (write-to-string (busca (list 1 2 3 4 5) 7)))
    (write-line (write-to-string (busca (list 1 2 3 4 5) 5)))
    (write-line (write-to-string (busca (list 1 2 3 4 5) 1)))
    (write-line (write-to-string (busca (list 1 2 3 4 5) 3)))
    
)

(main)