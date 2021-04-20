;at main.lisp
;; ============ tableInfos.hs

;;type tuple
(defstruct tuple
    x
    y
)

;;table_design: Tabela onde o formato das caixas do suguru é descrito.
;; Cada caixa tem um número e esse número é alocado nas posições que representam a caixa.
(setq table_design '(0   0  0  1  2  2  3  3
                    0   4  4  1  2  2  3  3
                    4   4  1  1  2  5  5  3
                    4   6  6  1  7  7  5  5
                    8   8  6  6  7  9  9  5
                    10  8  8  6  7 11  9  9
                    10 10  8 12  7 11 11  9
                    10 10 12 12 12 12 11 11
                )
)

;(setq table_design '(0 0 0 1 1
;                     0 2 2 3 1
;                     2 2 3 3 1
;                     2 3 3 4 1
;                     4 4 4 4 5
;                    )
;)

;; representa as posições indefinidas da tabela
(setq table '(-1 -1 -1  3 -1 -1  2 -1
               4 -1 -1 -1 -1 -1 -1 -1
              -1  2 -1 -1 -1 -1 -1 -1
              -1  1  5 -1 -1  1  5 -1
              -1  2 -1 -1 -1 -1 -1 -1
              -1 -1 -1 -1  4 -1 -1  4
              -1 -1 -1 -1 -1  3 -1 -1
              -1  5 -1 -1 -1  5 -1 -1
            )
)

;(setq table '(1 -1 -1  5 -1
;             -1 -1 -1 -1 -1
;              1 -1  2 -1  4
;             -1 -1 -1 -1 -1
;             -1  3 -1 -1 -1
;             )
;)

;; valor inteiro que representa o número de linhas e colunas da tabela
(setq size (sqrt (length table)))

;; addBorder: As tabelas serão atualizadas com a criação de uma borda representada pelo número -2.
;; Isso é feito para facilitar os testes para saber se os valores vizinhos são iguais ao valor que o software
;; está tentando alocar no momento. Sem essa borda, quando uma posição testada fosse nas laterais ou quinas da tabela,
;; isso exigiria cálculos específicos para teste dos vizinhos e geraria mais linhas de código a serem executados.
(defun addBorder (lista i)
    (if (null lista)
        ()
        (if (= (mod i size) 0)
            (if (> i 0)
                (append (list -2 -2) (list (car lista)) (addBorder (cdr lista) (+ i 1)))
                (append (list -2) (list (car lista)) (addBorder (cdr lista) (+ i 1)))
            )
            (cons (car lista) (addBorder (cdr lista) (+ i 1)))
        )
    )
)

;; take: Recebe uma lista e um numero n, e retorna uma lista formada pelos primeiros n elementos da lista dada
(defun take (lista n)
    (if (<= n 0)
        ()
        (append (list (car lista)) (take (cdr lista) (- n 1)))
    )
)

;; drop: Recebe uma lista e um numero n, e retorna uma lista SEM os primeiros n elementos da lista dada
(defun drop (lista n)
    (if (<= n 0)
        lista
        (drop (cdr lista) (- n 1))
    )
)

;; chop: Utilizado para dividir uma lista de inteiros em uma lista de listas de tamanho n de inteiros
(defun chop (n lista)
    (if (null lista)
        ()
        (cons (take lista n) (chop n (drop lista n)))
    )
)

;; getNumOfBoxes: Recebe uma table_desing e retorna o número de caixas (sub-blocos) contidos nela
;; baseando-se na numeração usada para identificar essas caixas
(defun getNumOfBoxes (lista n)
    (if (null lista)
        n
        (getNumOfBoxes (cdr lista) (max (car lista) n))
    )
)

;; count: Conta o número de posições com valor 'n' na tabela. Usado para contar o número de posições
;; de uma caixa com id 'n' da table_design
(defun count1 (lista n)
    (if (null lista)
        0
        (if (= (car lista) n)
            (+ 1 (count1 (cdr lista) n))
            (count1 (cdr lista) n)
        )
    )
)

;; getPositions: Retorna lista de posiões de uma determinada caixa
(defun getPositions (lista n i)
    (if (null lista)
        ()
        (if (= (car lista) n)
            (cons i (getPositions (cdr lista) n (+ i 1))) ;;; CONFIRMAR SE O CONS FUNCIONA AQUI
            (getPositions (cdr lista) n (+ i 1))
        )
    )
)

;;getValidPositions: Retorna a tabela apenas com suas posições válidas, isto é,
;; sem as bordas ou posições com valor indefinido
(defun getValidPositions (lista)
    (if (null lista)
        ()
        (if (< (car lista) 0)
            (getValidPositions (cdr lista))
            ;(append (list (car lista)) (getValidPositions (cdr lista))
            (append (list (car lista)) (getValidPositions (cdr lista)))
        )
    )
)

;; printTable: Printa a matriz que é dada como entrada
(defun printTable (lista)
    (if (not (null lista))
        (printTableAux lista 0)
    )
)

(defun printTableAux (lista n)
    (if (not (null lista))
        (if (= n (- size 1))
            (progn
                (write-line (write-to-string (car lista)))
                (printTableAux (cdr lista) 0)
            )
            (progn
                (write (car lista))
                ;(write " ") ;;; ACHAR UM JEITO DE IMPRIMIR ESPAÇO SEM O ""
                (terpri)
                (printTableAux (cdr lista) (+ n 1))
            )
        )
    )
)

;; cria uma lista com n elementos igual a x
(defun createBorder (x n)
    (if (= n 0)
        ()
        (cons x (createBorder x (- n 1)))
    )
)

;; [(x, count table_design x) | x<-[0..num_of_boxes - 1]]
;; cria uma lista com n elementos tuplas de (x,c) onde c é constante
(defun createListTuples1 (x n)
    (if (= n 0)
        ()
        (cons (list x (count1 table_design x)) (createListTuples1 (+ x 1) (- n 1)))
    )
)

;; [(x, getPositions final_table_design x 0) | x<-[0..num_of_boxes - 1]]
;; cria uma lista com n elementos tuplas de (x,c) onde c é constante
(defun createListTuples2 (x n)
    (if (= n 0)
        ()
        ; (cons (list x (getPositions final_table_design x 0)) (createListTuples1 (+ x 1) (- n 1)))
        (cons (make-tuple
                  :x x
                  :y (getPositions final_table_design x 0)
              ) (createListTuples2 (+ x 1) (- n 1))
        )
    )
)

;; um novo tamanho é calculado considerando as bordas
(setq _size (+ size 2))

;; processo de criação das bordas
(setq top_bottom_border (createBorder -2 _size))
(setq temp_table (addBorder table 0))
(setq temp_table_design (addBorder table_design 0))
(setq final_table (append top_bottom_border temp_table top_bottom_border (list -2)))
(setq final_table_design (append top_bottom_border temp_table_design top_bottom_border (list -2)))

; ;; criação de estruturas de dados a serem usadas durante a execução do programa
(setq num_of_boxes (+ (getNumOfBoxes table_design -1) 1))
(setq boxes_size (createListTuples1 0 num_of_boxes))
(setq boxes_positions (createListTuples2 0 num_of_boxes))








;; ============ suguru.hs
(defun pushBack (lst a)
    (if (null lst)
        (list a)
        (cons (car lst) (pushBack (cdr lst) a))
    )
)


;;getBoxNumber: Recebe a table_design e uma posição como entradas e retorna o id da caixa em que a posição se encontra
(defun getBoxNumber (lista n i)
    (if (null lista)
        -1
        (if (= i n)
            (car lista)
            (getBoxNumber (cdr lista) n (+ i 1))
        )
    )
)

;; getBoxSize: Retorna o tamanho da caixa com id dado como entrada
(defun getBoxSize (lista box_number)
    (if (null lista)
        0
        (if (= (car lista) box_number)
            (+ 1 (getBoxSize (cdr lista) box_number))
            (getBoxSize (cdr lista) box_number)
        )
    )
)

;; getBoxPositions: Retorna lista com as posições da caixa com número de id dado na entrada do método
(defun getBoxPositions (n lista)
    (if (null lista)
        ()
        (if (= (getFirst (car lista)) n)
            (getSecond (car lista))
            (getBoxPositions n (cdr lista))
        )
    )
)

;; getFirst: Retorna primeiro item da tupla dada como entrada
(defun getFirst (e)
    (tuple-x e)
)

;; getSecond: Retorna segundo item da tupla dada como entrada
(defun getSecond (e)
    (tuple-y e)
)

(defun checkValidPosLoop(lst i box_positions v)
    (if (null box_positions)
        T
        (and (isPositionValid lst i (car box_positions) v) (checkValidPosLoop lst i (cdr box_positions) v))
    )
)

;; isPositionValid: Função chamada por 'isNeighborhoodClean' e 'isBoxClean' que verifica se a posição atual da análise desses métodos 
;; está de acordo com os requisitos do suguru
(defun isPositionValid (lst i n v)
    (if (null lst)
        T
        (if (= n i)
            (not (= (car lst) v))
            (isPositionValid (cdr lst) (+ i 1) n v)
        )
    )
)


;; isBoxClean: Verifica se a caixa da posições em análise tem valores de acordo com o valor testado
(defun isBoxClean (updt_table box_positions v)
    (if (null updt_table)
        T
        (progn
            (setq boolList_ft (checkValidPosLoop final_table 0 box_positions v))
            (setq boolList_ut (checkValidPosLoop updt_table 0 box_positions v))
            (and boolList_ft boolList_ut)
        )
    )
)

;; isNeighborhoodClean: Verifica se as posições vizinhas à posição em análise estão de acordo com o valor testado
(defun isNeighborhoodClean (updt_table n v)
    (progn
        (setq p1 (- n (- _size  1)))
        (setq p2 (- n _size))
        (setq p3 (- n (+ _size 1)))
        (setq p4 (- n 1))

        (setq ut_positions (list p1 p2 p3 p4))
        (setq ft_positions (append ut_positions (list (+ n 1) (+ n (- _size 1)) (+ n _size) (+ n (+ _size 1)))))

        ;; [isPositionValid final_table 0 n v | n<-ft_positions]
        (setq boolList_ft (checkValidPosLoop final_table 0 ft_positions v))

        ;; [isPositionValid updt_table 0 n v | n<-ut_positions]
        (setq boolList_ut (checkValidPosLoop updt_table 0 ut_positions v))

        (and boolList_ut boolList_ft)
    )
)

;; nextPosition: Retorna a próxima posição indefinida que deverá ser ajustada (e -1 caso a tabela já tenha sido completamente percorrida). 
;; Durante a execução da função, as posições previamente definidas da tabela são adicionadas à lista updt_table (que representa a tabela
;; final atualizada)
(defun nextPosition (ft ut i n)
    (if (null ft)
        (make-tuple :x -1 :y NIL)
        
        (if (or (> n (* _size _size)) (> i (* _size _size)))
            (make-tuple :x -1 :y ut)
            
            (if (>= i n)
                (if (= (car ft) -1)
                    (make-tuple :x i :y ut)
                    
                    (nextPosition (cdr ft) (pushBack ut (car ft)) (+ i 1) n)
                )
                
                (nextPosition (cdr ft) ut (+ i 1) n)
            )
        )
    )
)

;; checkValidation: Verifica se o valor a ser adicionado à posição requerida está dentro dos requisitos necessários.
;; Esta função é a responsável por manter o loop responsável pela varredura da tabela analisada
(defun checkValidation (f_table updt_table n box_n v vf)
    (if (null f_table)
        (make-tuple :x NIL :y NIL)
        (progn
            (setq neighborhoodClean (isNeighborhoodClean updt_table n v) )
            (setq boxPositions (getBoxPositions box_n boxes_positions))
            (setq boxClean (isBoxClean updt_table boxPositions v))

            (if (<= v vf)
                (if (and neighborhoodClean boxClean)
                    (progn
                        (setq next (nextPosition final_table (append updt_table (list v)) 0 (+ n 1)))
                        (setq new_n (getFirst next))

                        (if (< new_n 0)
                            (make-tuple :x T :y (append updt_table (list v)))
                            (progn
                                (setq aux (setPosition (getSecond next) new_n))
                                (setq isFinished (getFirst aux))
                                (setq new_updt_table (getSecond aux))

                                (if (not isFinished)
                                    (checkValidation f_table updt_table n box_n (+ v 1) vf)
                                    ;(list T new_updt_table)
                                    (make-tuple :x T :y new_updt_table)
                                )
                            )
                        )
                    )
                    (checkValidation f_table updt_table n box_n (+ v 1) vf)
                )
                (make-tuple :x NIL :y NIL)
            )
        )
    )
)


;; setPosition: Recebe a tabela a ser atualizada com as novas posições e a posição atual a ser calculada.
;; Captura as estruturas de dados necessárias para os cálculos de validação da posição
(defun setPosition (updt_table n)
    (progn
        (setq box_number (getBoxNumber final_table_design n 0))
        (setq box_size (getBoxSize table_design box_number))
        (checkValidation final_table updt_table n box_number 1 box_size)
    )
)

;; ============ main 

(defun main()
    (setq next (nextPosition final_table '() 0 0))
    (setq resulting_table (getSecond (setPosition (getSecond next) (getFirst next))))

    (printTable (chop size (getValidPositions resulting_table)))
)

(main)
