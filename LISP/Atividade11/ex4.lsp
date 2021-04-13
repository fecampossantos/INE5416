(defun XOR2 (x y)
;(NOT(A AND B)) AND (NOT(NOT A AND NOT B))
    (and (not (and x y)) (not (and (not x) (not y))))
)

(defun main()
    (setq v1 (read))
    (setq v2 (read))
    ;(setq v1 (getBool v1aux))
    ;(setq v2 (getBool v2aux))
    (write (XOR2 v1 v2))
)


(main)