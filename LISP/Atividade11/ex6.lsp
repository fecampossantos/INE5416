(defun tri (a b c)
    (and (possivel a b c) (and (possivel b a c) (possivel c a b)))
)

(defun possivel (a b c)
    (and (< a (+ b c)) (> a (- b c)))
)

(defun main()
    (setq n1 (read))
    (setq n2 (read))
    (setq n3 (read))
    (setq m (tri n1 n2 n3))
    (write m)
)


(main)