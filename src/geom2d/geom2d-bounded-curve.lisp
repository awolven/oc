(in-package :oc)

(defmethod end-point ((curve geom2d-bounded-curve))
  (let* ((pointer (_wrap_Geom2d_BoundedCurve_EndPoint (ff-pointer curve)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct (lambda () (_wrap_delete_gp_Pnt2d pointer)) :dont-save t)
    struct))

(defmethod start-point ((curve geom2d-bounded-curve))
  (let* ((pointer (_wrap_Geom2d_BoundedCurve_StartPoint (ff-pointer curve)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct (lambda () (_wrap_delete_gp_Pnt2d pointer)) :dont-save t)
    struct))
