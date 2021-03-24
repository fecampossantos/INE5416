(defun operation(op x y)
    (cond
        ((eq op '+) (+ x y))
        ((eq op '-) (- x y))
        ((eq op '*) (* x y))
        ((eq op '/) (/ x y))
        (T "No operation for the symbol!")
    )
    
)

(defun main ()
    (setq x (read))
    (setq op (read))
    (setq y (read))
    
    
    (write (operation op x y))
)

(main)