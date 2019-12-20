(in-package :oc)

(defmethod end-point ((curve geom-bounded-curve))
  (let* ((pointer (_wrap_Geom_BoundedCurve_EndPoint (ff-pointer curve)))
	 (struct (gp::make-pnt :ptr pointer)))
    (sb-ext:finalize struct (lambda () (_wrap_delete_gp_Pnt pointer)) :dont-save t)
    struct))

(defmethod start-point ((curve geom-bounded-curve))
  (let* ((pointer (_wrap_Geom_BoundedCurve_StartPoint (ff-pointer curve)))
	 (struct (gp::make-pnt :ptr pointer)))
    (sb-ext:finalize struct (lambda () (_wrap_delete_gp_Pnt pointer)) :dont-save t)
    struct))