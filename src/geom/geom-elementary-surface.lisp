(in-package :oc)

(defmethod get-location ((self geom-elementary-surface))
  (let ((struct (gp::make-pnt :ptr (_wrap_Geom_ElementarySurface_Location (ff-pointer self)))))
    (oc:finalize struct)
    struct))
