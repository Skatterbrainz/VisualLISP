(defun c:pointlabel ( / pnt )
  (while (setq pnt (getpoint "\nSpecify point: "))
    (progn
            (entmake
                (list
                   '(0 . "POINT")
                    (cons 10 (trans pnt 1 0))
                )
            )
            (entmake
                (list
                   '(0 . "TEXT")
                    (cons 10 (trans (cons (+ (car pnt) 0.6) (cdr pnt)) 1 0))
                    (cons 40 (getvar 'textsize))
                    (cons  1 (strcat "X:" (rtos (car pnt)) " Y:" (rtos (cadr pnt))))
                )
            )
        )
    )
    (princ)
)
