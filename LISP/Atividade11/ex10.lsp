(defun biggest(a b c)
    (if (and  (> a b) (> a c))
        a
        (if (and (> b a) (> b c)) 
            b
            c
        ))
)


(defun main ()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write "The biggest is: ")
    (write (biggest a b c))
)

(main)