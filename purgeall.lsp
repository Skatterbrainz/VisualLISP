; command = c:purgeall
; author  = David Stein
; created = 2004.02.03
; purge all opened drawing sessions

(vl-load-com)

(defun C:PURGEALL ( / item cur)
  (princ "\nPurging all opened drawings...")
  (setq dcount 0)
	(vlax-for item (vla-get-Documents (vlax-get-Acad-Object))
		(vla-PurgeAll item)
    (setq dcount (1+ dcount))
	)
	(princ (strcat "\n" dcount " drawings purged."))
	(princ)
)

(princ)
