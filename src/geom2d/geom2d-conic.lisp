(in-package :oc)

(defmethod (setf axis) ((A gp::ax22d) (conic geom2d-conic))
  (_wrap_Geom2d_Conic_SetAxis (ff-pointer conic) (ptr A)))

(defmethod (setf x-axis) ((A gp::ax2d) (conic geom2d-conic))
  (_wrap_Geom2d_Conic_SetXAxis (ff-pointer conic) (ptr A)))

(defmethod (setf y-axis) ((A gp::ax2d) (conic geom2d-conic))
  (_wrap_Geom2d_Conic_SetYAxis (ff-pointer conic) (ptr A)))

(defmethod (setf geom-location) ((P gp::pnt2d) (conic geom2d-conic))
  (_wrap_Geom2d_Conic_SetLocation (ff-pointer conic) (ptr P)))

(defmethod x-axis ((conic geom2d-conic))
  (let* ((pointer (_wrap_Geom2d_Conic_XAxis (ff-pointer conic)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Ax2d pointer)) :dont-save t)
    struct))

(defmethod y-axis ((conic geom2d-conic))
  (let* ((pointer (_wrap_Geom2d_Conic_YAxis (ff-pointer conic)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Ax2d pointer)) :dont-save t)
    struct))

(defmethod eccentricity ((conic geom2d-conic))
  (_wrap_Geom2d_Conic_Eccentricity (ff-pointer conic)))

(defmethod location ((conic geom2d-conic))
  (let* ((pointer (_wrap_Geom2d_Conic_Location (ff-pointer conic)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Pnt2d pointer)) :dont-save t)
    struct))

(defmethod oc:position ((conic geom2d-conic))
  (let* ((pointer (_wrap_Geom2d_Conic_Position (ff-pointer conic)))
	 (struct (gp::make-ax22d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Ax22d pointer)) :dont-save t)
    struct))
