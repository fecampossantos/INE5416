(defun  delta (a b c)
    (- (expt b 2) (* 4 (* a c)))
)

  
(defun raizes (a b delta)
  (list 
        (/ (+ (* b -1) (sqrt delta)) (* 2 a))
	    (/ (- (* b -1) (sqrt delta)) (* 2 a))
    )

)
(defun bhaskara (a b c)
    (unless (< (delta a b c) 0)
        (raizes a b (delta a b c))
    )
)
    
(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write (bhaskara a b c))
)

(main)
