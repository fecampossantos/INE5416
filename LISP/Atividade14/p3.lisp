(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    
    (/ (+ (* b -1) (sqrt (- (* b b) (* 4 (* a c)) ))) (* 2 a))

    (write ((lambda (a b c) (cons (/ (+ (* b -1) (sqrt (- (* b b) (* 4 (* a c)) ))) (* 2 a)) (/ (- (* b -1) (sqrt (- (* b b) (* 4 (* a c)) ))) (* 2 a)) )) a b c))
)

(main)