(defun List->VariantArray 
  (ptsList datatype / arraySpace sArray)
  (setq arraySpace
    (vlax-make-safearray
      (eval datatype)
        (cons 0
          (- (length ptsList) 1)
        )
      )
    )
  )
  (setq sArray (vlax-safearray-fill arraySpace ptsList))
  (vlax-make-variant sArray)
)
