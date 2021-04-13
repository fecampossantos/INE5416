(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+ 
            (no-n arv) 
            (soma (no-esq arv)) 
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or 
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x) 
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo 
            (no-n arv) 
            (minimo 
                (minimoElemento (no-esq arv)) 
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

(defun ocorrenciasElemento (arv x)
    (if (null arv)
        0
        (if (= (no-n arv) x)
            (+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x) 1)
            (+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x) 0)
        )
    )
)

(defun maioresQueElemento (arv x)
    (if (null arv)
        0
        (if (> (no-n arv) x)
            (+ (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x) 1)
            (+ (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x) 0)
        )
    )
)

(defun quantidade (arv)
    (if (null arv)
        0
        (+ 1 (quantidade (no-esq arv)) (quantidade (no-dir arv)))
    )
)

(defun mediaElementos (arv)
    (/ (soma arv) (quantidade arv))
)

;;;; TODO E

;; (defun elementos (arv)
;;     (if (null arv)
;;         ()
        
;;     )
;; )

(defun substituir (arv x y)
    (if (not (null arv))
        (if (= (no-n arv) x)
            (progn
                (setf (no-n arv) y)
                (substituir (no-esq arv) x y)
                (substituir (no-dir arv) x y)
            )
            (progn
                (substituir (no-esq arv) x y)
                (substituir (no-dir arv) x y)
            )
        )
    )
)

;;;;; TODO G H I

(defun subtraiParesImpares (arv)
    (- (somaPares arv) (somaImpares arv))
)

(defun somaPares (arv)
    (if (null arv)
        0
        (if (= (mod (no-n arv) 2) 0)
            (+ (no-n arv) (somaPares (no-esq arv)) (somaPares (no-dir arv)))
            (+ (somaPares (no-esq arv)) (somaPares (no-dir arv)))
        )
    )
)

(defun somaImpares (arv)
    (if (null arv)
        0
        (if (not (= (mod (no-n arv) 2) 0))
            (+ (no-n arv) (somaImpares (no-esq arv)) (somaImpares (no-dir arv)))
            (+ (somaImpares (no-esq arv)) (somaImpares (no-dir arv)))
        )
    )
)

(defun novoNo (x)
    (make-no 
        :n x
        :esq NIL
        :dir NIL
    )
)

;(defun inserir (arv x)
;    (if (null arv)
;        (novoNo x)
;        (if (> x (no-n arv))
;            (if (null (no-n (no-dir arv)))
;                (setf (no-dir arv) (novoNo x))
;                (inserir (no-dir arv) x)
;            )
;            (if (null (no-n (no-esq arv)))
;                (setf (no-esq arv) (novoNo x))
;                (inserir (no-esq arv) x)
;            )
;        )
;    )
;)

(defun main()
    ;(write-line (write-to-string minhaArvore))
    ;(write-line (write-to-string (soma minhaArvore)))
    ;(write-line (write-to-string (buscaElemento minhaArvore 35)))
    ;(write-line (write-to-string (buscaElemento minhaArvore 36)))
    ;(write-line (write-to-string (minimoElemento minhaArvore)))
    ;(write-line (write-to-string (incrementa minhaArvore 2)))
    ;(write-line (write-to-string (ocorrenciasElemento minhaArvore 32)))
    ;(write-line (write-to-string (maioresQueElemento minhaArvore 54)))
    ;(write-line (write-to-string (mediaElementos minhaArvore)))
    ;;;;;;;(write-line (write-to-string (elementos minhaArvore)))
    ;(substituir minhaArvore 12 120)
    ;(write-line (write-to-string minhaArvore))
    ;(write-line (write-to-string (subtraiParesImpares minhaArvore)))
    (setq arv2 (novoNo 10))
    ;(write-line (write-to-string arv2))
    ;(inserir arv2 5)
    ;(inserir arv2 12)
    (write-line (write-to-string arv2))
    
)

(main)