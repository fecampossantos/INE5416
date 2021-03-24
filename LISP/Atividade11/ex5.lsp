(defun media (x y z)
    (/ (+ x (+ y z)) 3)
)

(defun resultado (a)
    (cond
        ((>= a 6) "Aprovado")
        (T "Reprovado")
    )
)

(defun main()
    (setq n1 (read))
    (setq n2 (read))
    (setq n3 (read))
    (setq m (media n1 n2 n3))
    (write (resultado m))
)


(main)