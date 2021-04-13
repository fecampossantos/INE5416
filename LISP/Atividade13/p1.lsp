(defstruct 2d
    x
    y
)


(defun getX (a)
    (2d-x a)
)

(defun getY (a)
    (2d-y a)
)

(defun exp2 (a)
    (* a a)
)

(defun distancia (a b)
    (if (null a)
        NIL
        (if (null b)
            NIL
            (sqrt (+ (exp2 (- (2d-x b) (2d-x a))) (exp2 (- (2d-y b) (2d-y a)))))
        )
    )
)

(defun colineares (a b c)
    (if (= 
            (-
                (+ (* (getX a) (getY b)) (* (getY a) (getX c)) (* (getX b) (getY c)) )
                (+ (* (getX c) (getY b)) (* (getY c) (getX a)) (* (getX b) (getY a)) )
            )
        0 )
        T
        NIL
    )
)

(defun formaTriangulo (p1 p2 p3)
    (if (colineares p1 p2 p3)
        NIL
        (progn 
            (setq a (distancia p1 p2))
            (setq b (distancia p2 p3))
            (setq c (distancia p3 p1))
            (and (formaTrianguloAux a b c) (formaTrianguloAux b a c) (formaTrianguloAux c a b))
            )
    )
)

(defun getDistancias (a b c)
    (values (distancia a b) (distancia b c) (distancia c a))
)

(defun formaTrianguloAux (a b c)
    (and (< a (+ b c)) (> a (abs (- b c))))
)

(defun main()
    (setq p1    (make-2d 
                    :x 0
                    :y 0
                )
    )

    (setq p2    (make-2d 
                    :x 3
                    :y 0
                )
    )

    (setq p3    (make-2d 
                    :x 0
                    :y 4
                )
    )
    
    (setq p4    (make-2d 
                    :x 10
                    :y 0
                )
    )
    
    (write-line (write-to-string (formaTriangulo p1 p2 p4)))
    (write-line (write-to-string (formaTriangulo p1 p2 p3)))
    
    
)

(main)