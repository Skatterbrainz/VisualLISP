; the 'hello world' of examples

(defun C:DRAWLINE
    (/ p1 p2)
    (setq 
        p1 (getpoint "\nStart point:")
        p2 (getpoint p1 "\nEnd point:")
    )
    (command "_.line" p1 p2 "")
    (princ)
)
