(in-package :oc)

(defmethod evaluate-curve ((curve geom-curve) (U real))
  ;; opencascade returns a gp_Pnt
  ;; the swig wrapper, however, returns a pointer to a new gp_Pnt (via copy constructor)
  ;; this needs a finalizer.
  (let* ((pointer (_wrap_Geom_Curve_Value (ff-pointer curve) (coerce U 'double-float)))
	 (struct (gp::make-pnt :ptr pointer)))
    (oc:finalize struct)
    struct))


