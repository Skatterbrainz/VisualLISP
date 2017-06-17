; ShipWorks command which toggles automatic layer management on or off

(defun C:AUTOLAY ()
  (if autolay
    (progn
      (vl-Registry-Write "HKEY_CURRENT_USER\\SOFTWARE\\ShipWorks" "AutoLay" "0")
      (setq autolay nil)
      (princ "\nShipWorks Layer Management Services Disabled. ")
    )
    (progn
      (setq autolay (vl-Registry-Write "HKEY_CURRENT_USER\\SOFTWARE\\ShipWorks" "AutoLay" "1"))
      (princ "\nShipWorks Layer Management Services Enabled. ")
    )
  )
  (princ)
)
