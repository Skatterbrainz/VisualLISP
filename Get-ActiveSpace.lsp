
; returns object handle to the active working space in AutoCAD (model or paper space)

(defun Get-ActiveSpace ()
	(if (= acModelSpace (vla-get-ActiveSpace (vla-get-ActiveDocument (vlax-get-Acad-Object))))
		(vla-get-ModelSpace (vla-get-ActiveDocument (vlax-get-Acad-Object)))
		(if (= (vla-get-MSpace (vla-get-ActiveDocument (vlax-get-Acad-Object))) :vlax-True)
			(vla-get-ModelSpace (vla-get-ActiveDocument (vlax-get-Acad-Object)))
			(vla-get-PaperSpace (vla-get-ActiveDocument (vlax-get-Acad-Object)))
		)
	)
)
