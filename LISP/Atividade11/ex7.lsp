(defun fibo (a)
    (cond
        ((< a 3) 1)
        (T (+ (fibo (- n 1)) (fibo (- n 2)) ))
    )
)

(defun main()
    (setq n (read))
    (write (fibo n))
)


(main)