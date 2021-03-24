(defun soma (a)
    (if (null a)
        0
        (+ (car a) (soma (cdr a)))
    )
)

(defun main()
    (write (soma (list 1 2 3 4)))
)

(main)
