(in-package :oc)

(defmethod get-location ((self geom-elementary-surface))
  (gp::make-pnt :ptr (_wrap_Geom_ElementarySurface_Location (ff-pointer self))))
