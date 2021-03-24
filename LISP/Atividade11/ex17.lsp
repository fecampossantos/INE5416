(defun ePrimo(a)
    (if (< a 2)
        T
        (ePrimoAux a 2)
    )
)

(defun ePrimoAux(a b)
    (if (= b a)
        T
        (if (= (mod a b) 0)
            NIL
            (ePrimoAux a (+ b 1))
        ))
)

(defun main ()
    (setq a (read))
    
    (write (ePrimo a))
)

(main)