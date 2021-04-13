(defun apagar (n lista)
    (if (null lista)
        "A lista esta vazia!"
        (apagarAux n lista 0 )
    )
)

(defun apagarAux (n lista count)
    (if (null lista)
        ()
        (if (< count n)
            (apagarAux n (cdr lista) (+ count 1))
            (cons (car lista) (apagarAux n (cdr lista) (+ count 1)))
        )
    )
)


(defun main()
    (write-line (write-to-string (apagar 3 (list 1 2 3 4 5))))
    (write-line (write-to-string (apagar 1 (list 1 2 3 4 5))))
    (write-line (write-to-string (apagar 2 (list 1 2 3 4 5))))
    (write-line (write-to-string (apagar 4 (list 1 2 3 4 5 6))))
    (write-line (write-to-string (apagar 6 (list 1 2 3 4 5 6))))
    (write-line (write-to-string (apagar 10 (list 1 2 3 4 5 6))))
)

(main)