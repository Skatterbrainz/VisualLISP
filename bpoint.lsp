; Break at Point

(defun C:BPOINT (/ en p1)
  (setq en (entsel "\nSelect entity to break: "))
  (if (= (cdr (assoc 0 (entget (car en)))) "LINE")
    (progn
      (setq p1 (getpoint "\nSelect break point: "))
      (command "_break" (xy p1) "_f" (XY p1) (XY p1))
    )
    (princ "\nEntity must be a LINE.")
  )
  (princ)
)

(defun XY (pt1)
  (list (car pt1) (cadr pt1))
)
