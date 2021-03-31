(defun primeiros (n lista)
    (if (null lista)
        "A lista esta vazia!"
        (primeirosAux n lista 0 )
    )
)

(defun primeirosAux (n lista count)
    (if (null lista)
        ()
        (if (= count n)
            ()
            (cons (car lista) (primeirosAux n (cdr lista) (+ count 1)))
        )
    )
)


(defun main()
    (write-line (write-to-string (primeiros 4 (list 1 2 3 4 5 6))))
    (write-line (write-to-string (primeiros 6 (list 1 2 3 4 5 6))))
    (write-line (write-to-string (primeiros 10 (list 1 2 3 4 5 6))))
)

(main)