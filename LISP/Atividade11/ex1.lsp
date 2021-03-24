(defun expo (x y)
    (expt x y)
)

(defun main()
(princ "Enter base: ")
(setq x (read))
(princ "Enter exponent: ")
(setq y (read))
(setq result (expo x y))
(write result)
)


(main)