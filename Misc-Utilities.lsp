(defun Convert-DegreesToRadians (a) (* pi (/ a 180.0)) )

(defun Convert-RadiansToDegrees (a) (/ (* a 180.0) pi) )

; set transaction rollback point

(defun Set-UndoBegin ()
	(vla-EndUndoMark   (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
	(vla-StartUndoMark (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
)

; close transaction extent

(defun Set-UndoEnd () 
	(vla-EndUndoMark (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
)
