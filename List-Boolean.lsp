;***************************************************************************
; MODULE: List_Boolean (sys21)
; DESCRIPTION: Performs various Boolean operations with two given lists
; ARGS: list1, list2, boole (0=Union, 1=Intersection, -1=Subtraction)
; EXAMPLE: (List_Bool '("A" "B") '("B" "D") 0) --> ("A" "B" "B" "D")
;
;  The following function performs boolean operations on lists:
;  Example: (setq L1 '("A" "B" "C")) (setq L2 '("1" "B" "D" "E"))
;    (List_Boolean L1 L2  0)... returns ("A" "B" "C" "1" "D" "E")  UNION
;    (List_Boolean L1 L2  1)... returns ("B")                      INTERSECT
;    (List_Boolean L1 L2 -1)... returns ("A" "C")                  SUBTRACT
;    (List_Boolean L2 L1 -1)... returns ("1" "D" "E")              SUBTRACT
;***************************************************************************

(defun List_Boolean
  (ls1 ls2 bol / rsl lel act)
  (setq rsl '() )
  (cond
    ( (and
        (listp ls1) (listp ls2) (member bol '(-1 0 1))
      )
      (if (= bol 0) (setq ls1 (append ls1 ls2)))
      (while (setq lel (car ls1))
        (setq act
              (cond
                ( (= bol -1) ; Subtract
                  (and
                    (not (member lel rsl))
                    (not (member lel ls2))
                  )
                )
                ( (= bol  0) ; Union
                  (not (member lel rsl))
                )
                ( (= bol  1) ; Intersect
                  (and
                    (not (member lel rsl))
                    (member lel ls2)
                  )
                )
              )
            ls1 (cdr ls1)
            rsl (if act (append rsl (list lel)) rsl)
        )
      )
    )
  )
  rsl
)
