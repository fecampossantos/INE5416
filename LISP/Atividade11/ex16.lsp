(defun divisiveis(a b)
    (if (= (mod a b) 0)
        T
        NIL
    )
)


(defun main ()
    (setq a (read))
    (setq b (read))
    
    (write (divisiveis a b))
)

(main)