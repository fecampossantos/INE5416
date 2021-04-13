(defun area (x y)
    (/ (* x y) 2)
)

(defun main()
    ;(setq nm (parse-integer (read)))
    (setq base (read))
    (setq h (read))
    (setq nm1 (area base h))
    (write nm1)
)


(main)