(in-package :oc)

(defmethod coord ((point geom2d-point))
  (with-foreign-objects ((p-x :double) (p-y :double))
    (_wrap_Geom2d_Point_Coord (ff-pointer point) p-x p-y)
    (values (mem-aref p-x :double) (mem-aref p-y :double))))

(defmethod processor ((point geom2d-point))
  (let* ((pointer (_wrap_Geom2d_Point_Pnt2d (ff-pointer point)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod x ((point geom2d-point))
  (_wrap_Geom2d_Point_X (ff-pointer point)))

(defmethod y ((point geom2d-point))
  (_wrap_Geom2d_Point_Y (ff-pointer point)))

(defmethod distance ((point geom2d-point) (other geom2d-point))
  ;; this is trivial to implement
  ;; i guess I'm just going to go through the swig layer
  ;; for completeness, I can use it for testing
  (_wrap_Geom2d_Point_Distance (ff-pointer point) (ff-pointer other)))

(defmethod square-distance ((point geom2d-point) (other geom2d-point))
  (_wrap_Geom2d_Point_SquareDistance (ff-pointer point) (ff-pointer other)))
