(defun mdc(a b)
    (cond
        ((= (mod b a) 0) a)
        ((= (mod a b) 0) b)
        ((> a b) (mdc b (mod a b)))
        ((> b a) (mdc a (mod b a)))
    )
)

(defun coprimos(a b)
    (if (= (mdc a b) 1)
        T
        NIL
    )
)

(defun getCoprimos(a b)
    (if (coprimos a b)
    "São coprimos! :D"
    "Não são coprimos! :c")
)


(defun main ()
    (setq a (read))
    (setq b (read))
    
    (write (getCoprimos a b))
)

(main)