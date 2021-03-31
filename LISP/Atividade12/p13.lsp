(defun mapear (f lista)
    (if (null lista)
        ()
        (if (funcall f (car lista))
            (mapear f (cdr lista))
            lista
        )
    )
)

(defun par (a)
    (= (mod a 2) 0)
)

(defun main ()
    (write-line (write-to-string (mapear (function par) (list 2 4 6 7 8 9 10))) )
)


(main)
