(defun filtrar(f l)
    (if (null l)
        ()
        (if (not (funcall f (car l)))
            (cons (car l) (filtrar f (cdr l)))
            (filtrar f (cdr l))
        )
    )
)

(defun main()
    (setq lista (list 1 2 3 4 5))
    
    (write-line 
        (write-to-string 
            (filtrar (lambda (x) (if (= 0 (mod x 2)) T NIL )) lista)
        )
    )
)

(main)
