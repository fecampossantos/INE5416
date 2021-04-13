(defun mdc(a b)
    (cond
        ((= (mod b a) 0) a)
        ((= (mod a b) 0) b)
        ((> a b) (mdc b (mod a b)))
        ((> b a) (mdc a (mod b a)))
    )
)


(defun main ()
    (setq a (read))
    (setq b (read))
    
    (write-line "The MDC is: ")
    (write (mdc a b))
)

(main)