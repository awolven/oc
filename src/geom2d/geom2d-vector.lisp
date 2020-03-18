(in-package :oc)

(defmethod reverse! ((vector geom2d-vector))
  (_wrap_Geom2d_Vector_Reverse (ff-pointer vector)))

(defmethod reversed ((vector geom2d-vector))
  (with-geom2d-vector (_wrap_Geom2d_Vector_Reversed (ff-pointer vector))))

(defmethod angle ((vector1 geom2d-vector) (vector2 geom2d-vector))
  (_wrap_Geom2d_Vector_Angle (ff-pointer vector1) (ff-pointer vector2)))

(defmethod coord ((vector geom2d-vector))
  (with-foreign-objects ((&X :double)
			 (&Y :double))
    (_wrap_Geom2d_Vector_Coord (ff-pointer vector) &X &Y)
    (values (mem-aref &X :double)
	    (mem-aref &Y :double))))

(defmethod magnitude ((vector geom2d-vector))
  (_wrap_Geom2d_Vector_Magnitude (ff-pointer vector)))

(defmethod square-magnitude ((vector geom2d-vector))
  (_wrap_Geom2d_Vector_SquareMagnitude (ff-pointer vector)))

(defmethod X ((vector geom2d-vector))
  (_wrap_Geom2d_Vector_X (ff-pointer vector)))

(defmethod Y ((vector geom2d-vector))
  (_wrap_Geom2d_Vector_Y (ff-pointer vector)))

(defmethod crossed ((vector geom2d-vector) (other geom2d-vector))
  (_wrap_Geom2d_Vector_Crossed (ff-pointer vector) (ff-pointer other)))

(defmethod dot ((vector geom2d-vector) (other geom2d-vector))
  (_wrap_Geom2d_Vector_Dot (ff-pointer vector) (ff-pointer other)))

(defmethod geom-processor ((vector geom2d-vector))
  (let* ((pointer (_wrap_Geom2d_Vector_Vec2d (ff-pointer vector)))
	 (struct (gp::make-vec2d :ptr pointer)))
    (oc:finalize struct)
    struct))



    
