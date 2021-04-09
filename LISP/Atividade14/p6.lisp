(defun mapear(f l)
    (if (null l)
        ()
        (cons (funcall f (car l)) (mapear f (cdr l)))
    )
)

(defun main()
    (setq lista (list 1 2 3 4 5))
    
    (write-line 
        (write-to-string 
            (mapear (lambda (x) (if (= 0 (mod x 2)) T NIL )) lista)
        )
    )
)

(main)
