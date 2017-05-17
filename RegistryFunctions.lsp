; set registry key default value

(defun Set-RegKey
	(keyname valuename dataval)
	(vl-load-com)
	(if (= nil valuename)
	    (vl-Registry-Write keyname "" dataval)
	    (vl-Registry-Write keyname valuename dataval)
  	)
)

; get registry key, or force default value if not found

(defun Get-RegKey 
	(keyname valuename defaultvalue / result)
	(vl-load-com)
	(if (= nil valuename)
    		(setq result (vl-Registry-Read keyname))
    		(setq result (vl-Registry-Read keyname valuename))
	)
  	(if (= nil result)
    		(progn
      			(Set-RegKey keyname valuename defaultvalue)
      			(setq result defaultvalue)
    		)
  	)
	result
)

(defun Get-AcadRegPath ()
  	(vl-load-com)
  	(vlax-machine-product-key)
)
