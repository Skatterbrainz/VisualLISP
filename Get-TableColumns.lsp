(defun Get-TableColumns (rsObject)
	(vlax-Get-Property rsObject "Fields")
)
