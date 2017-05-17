; explodes a block insertion, moves all entities to layer 0 and redefines the block reference in-place

(defun C:REBLOCK
  ( / sset ssln i ent els ipt rot xsc ysc zsc mark objects name rm)
	(cond
		( (setq sset (ssget '((0 . "INSERT"))))
			(setq i 0 ssln (sslength sset))
		  (setq rm (getvar "regenmode"))
		  (Set-UndoBegin)
			(setvar "regenmode" 0)
		  (repeat ssln
				(setq ent (ssname sset i)
							els (entget ent)
							name (cdr (assoc 2 els))
							ipt (cdr (assoc 10 els))
							rot (cdr (assoc 50 els))
							xsc (cdr (assoc 41 els))
							ysc (cdr (assoc 42 els))
							zsc (cdr (assoc 43 els))
							mark (entlast)
				)
				(command "_.explode" ent)
				(setq objects (Collect-Entities mark))
				(vl-cmdf "CHPROP" objects "" "_LA" "0" "_C" "BYLAYER" "")
				(command "_.block" name "Y" ipt objects "")
				(command "_.insert" name ipt "" "" "")
				(setq i (1+ i))
			)
		  (setvar "regenmode" rm)
		  (vl-cmdf "regen")
		  (Set-UndoEnd)
		)
	)
	(princ)
)

(defun Collect-Entities
  (y / x collectnext)
	(defun CollectNext (x / x-x)
	  (setq x-x (entnext (cdr (assoc -1 x)))
	        x-x (if x-x (entget x-x))
	  )
	)
  (setq
    x (ssadd)
    y (if y (entnext y) (entnext) )
  )
  (while y
    (setq w (entget y))
    (if (member (cdr (assoc 0 w)) '("VERTEX" "ATTRIB"))
      (while (/= (cdr (assoc 0 w)) "SEQEND")
        (setq w (CollectNext w))
      )
    )
    (if (= (cdr (assoc 0 w)) "SEQEND")
      (setq
        y  (CollectNext w)
        y  (if y (cdr (assoc -1 y)))
      )
    )
    (if y (setq x (ssadd y x) y (entnext y)) )
  )
  (setq x (if (> (sslength x) 0) x nil))
)

; set transaction rollback point

(defun Set-UndoBegin ()
  (vla-EndUndoMark   (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
	(vla-StartUndoMark (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
)

; close transaction extent

(defun Set-UndoEnd () 
  (vla-EndUndoMark (vla-Get-ActiveDocument (vlax-get-Acad-Object)))
)

(princ)
