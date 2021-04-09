(defun main()
    (setq nota1 (read))
    (setq nota2 (read))
    (setq nota3 (read))

    (write-line ((lambda (x y z)  (if (>= (/ (+ x (+ y z)) 3) 6) "Aprovado" "Reprovado") ) nota1 nota2 nota3))
)

(main)