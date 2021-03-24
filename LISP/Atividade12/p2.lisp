(defun comprimento a
    (if (null a) 
        0
        (+ 1 (comprimento (cdr a)))
    )
)

(defun soma (a)
    (if (null a)
        0
        (+ (car a) (soma (cdr a)))
    )
)

(defun media a
    (if (null a
        0
        (/ (soma a(comprimento a
    )
)

(defun main()
    (write (media (list 1 2 3 4)))
)

(main)
