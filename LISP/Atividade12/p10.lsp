(defun mapear (f lista)
    (if (null lista)
        ()
        (cons (funcall f (car lista)) (mapear f (cdr lista)))
    )
)

(defun mult2 (a)
    (* a 2)
)

(defun main ()
    (write-line (write-to-string (mapear (function mult2) (list 1 2 3 4 5))) )
)


(main)
