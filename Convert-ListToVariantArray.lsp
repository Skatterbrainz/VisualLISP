(defun Convert-ListToVariantArray 
	(ptsList datatype / arraySpace sArray)
	(setq arraySpace
		(vlax-Make-SafeArray
			(eval datatype)
			(cons 0 (- (length ptsList) 1))
		)
	)
	(setq sArray (vlax-SafeArray-Fill arraySpace ptsList))
	(vlax-Make-Variant sArray)
)
