;; OPERACOES EM LISTA

(defun comprimento (a)
    (if (null a) 
        0
        (+ 1 (comprimento (cdr a)))
    )
)

(defun soma (a)
    (if (null a)
        0
        (+ (car a) (soma (cdr a)))
    )
)

(defun media (a)
    (/ (soma a) (comprimento a))
)
;; ====================================


(defun alunos()
    '((1 "Bob" (5.6 8 9.3))
      (2 "Ana" (8.2 9 7 6.5))
      (3 "Tom" (3.2 7 5.7 8.3))
      (4 "Bin" (7.5 5.3 8.5 6.2 3.1))
      (5 "Bia" (6.7 4.1 5.5)))
)

(defun getNome (aluno)
    (car (cdr aluno))
)

(defun getNomes (lista)
    (if (null lista)
        ()
        (cons (getNome (car lista)) (getNomes (cdr lista)))
    )
)

(defun medias (alunos)
    (if (null alunos)
        ()
        (cons (list (getNome (car alunos)) (mediaAluno (car alunos))) (medias (cdr alunos)) )
    )
)

(defun mediaAluno (aluno)
    (media (car (cdr (cdr aluno))))
)

(defun somaMediaAlunos (alunos)
    (if (null alunos)
        0
        (+ (mediaAluno (car alunos)) (somaMediaAlunos (cdr alunos)) )
    )
)


(defun mediaTurma (alunos)
    (if (null alunos)
        0
        (/ (somaMediaAlunos alunos) (comprimento alunos) )
    )
)

(defun acimaMediaAux (alunos media)
    (if (null alunos)
        ()
        (if (>= (mediaAluno (car alunos)) media)
            (cons (list (getNome (car alunos)) (mediaAluno (car alunos)))  (acimaMediaAux (cdr alunos) media))
        )
    )
)

(defun acimaMedia (alunos)
    (acimaMediaAux alunos (mediaTurma alunos))
)

(defun aprovados (alunos)
    (if (null alunos)
        ()
        (if (>= (funcall (function mediaAluno) (car alunos)) 6)
            (cons (list (getNome (car alunos)) (mediaAluno (car alunos)))  (aprovados (cdr alunos)))
        )
    )
)

(defun duplas (alunos)
    (if (null alunos)
        ()
        (cons (formaDuplas (car alunos) (cdr alunos) ) (duplas (cdr alunos)))
    )
)

(defun formaDuplas (aluno alunos)
    (if (null alunos)
        ()
        (cons (list (getNome aluno) (getNome (car alunos))) (formaDuplas aluno (cdr alunos)) )
    )
)

(defun ordenarAlunos (alunos)
    (if (null alunos)
        ()
        (add (car alunos) (ordenarAlunos (cdr alunos)))
    )
)

(defun add (aluno alunos)
    (if (null alunos)
        (cons aluno ())
        
        (if (<= (car (cdr aluno)) (car (cdr (car alunos))))
            (cons aluno alunos)
            (cons (car alunos) (add aluno (cdr alunos)))
        )
    )
)


(defun main ()
    (write-line (write-to-string (getNomes (alunos))))
    (write-line (write-to-string (medias (alunos))))
    (write-line (write-to-string (mediaTurma (alunos))))
    (write-line (write-to-string (acimaMedia (alunos))))
    (write-line (write-to-string (aprovados (alunos))))
    (write-line (write-to-string (duplas (alunos))))
    (write-line (write-to-string (ordenarAlunos (medias (alunos)))))
)

(main)