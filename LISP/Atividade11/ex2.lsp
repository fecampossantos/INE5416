(defun abs2 (x)
    (cond  
        ((< x 0) (* x -1))
        (T x)
    )
)

(defun main()
    ;(setq nm (parse-integer (read)))
    (setq nm (read))
    (setq nm1 (abs2 nm))
    (write nm1)
)


(main)