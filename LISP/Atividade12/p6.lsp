(defun ocorrencias (lista x)
    (if (null lista)
        0
        (if (= (car lista) x)
            (+ 1 (ocorrencias (cdr lista) x))
            (+ 0 (ocorrencias (cdr lista) x))
        )
    )
)

(defun main()
    (write-line (write-to-string (ocorrencias (list 1 2 3 5 5 5 5 8 6 8 2 4) 1)))
    (write-line (write-to-string (ocorrencias (list 1 2 3 5 5 5 5 8 6 8 2 4) 5)))
    (write-line (write-to-string (ocorrencias (list 1 2 3 5 5 5 5 8 6 8 2 4) 2)))
    (write-line (write-to-string (ocorrencias (list 1 2 3 5 5 5 5 8 6 8 2 4) 7)))

)

(main)