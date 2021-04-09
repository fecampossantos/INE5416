(defun main()
    (setq v1 (read))
    (setq v2 (read))
    (write ((lambda (x y) (logxor x y)) v1 v2))
)

(main)