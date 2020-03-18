(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-vector-with-magnitude)
				       &rest initargs
				       &key V X Y P1 P2 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep V 'gp::vec2d)
		     (null X)  (null y)
		     (null P1) (null P2))
		(_wrap_new_Geom2d_VectorWithMagnitude__SWIG_0 (ptr V)))
	       ((and (null V) (typep X 'number) (typep Y 'number)
		     (null P1) (null P2))
		(_wrap_new_Geom2d_VectorWithMagnitude__SWIG_1 (coerce X 'double-float)
							      (coerce Y 'double-float)))

	       ((and (null V) (null X) (null Y)
		     (typep P1 'gp::pnt2d) (typep P2 'gp::pnt2d))
		(_wrap_new_Geom2d_VectorWithMagnitude__SWIG_2 (ptr P1) (ptr P2)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod (setf coord2) ((x real) (y real) (vector geom2d-vector-with-magnitude))
  (_wrap_Geom2d_VectorWithMagnitude_SetCoord (ff-pointer vector) (coerce x 'double-float)
					     (coerce y 'double-float)))

(defmethod (setf geom-processor) ((V gp::vec2d)  (vector geom2d-vector-with-magnitude))
  (_wrap_Geom2d_VectorWithMagnitude_SetVec2d (ff-pointer vector) (ptr V)))

(defmethod (setf X) ((X number) (vector geom2d-vector-with-magnitude))
  (_wrap_Geom2d_VectorWithMagnitude_SetX (ff-pointer vector) (coerce X 'double-float)))

(defmethod (setf Y) ((Y number) (vector geom2d-vector-with-magnitude))
  (_wrap_Geom2d_VectorWithMagnitude_SetY (ff-pointer vector) (coerce Y 'double-float)))

(defmethod add! ((vector1 geom2d-vector-with-magnitude) (vector2 geom2d-vector))
  (_wrap_Geom2d_VectorWithMagnitude_Add (ff-pointer vector1) (ff-pointer vector2)))

(defmethod added ((vector1 geom2d-vector-with-magnitude) (vector2 geom2d-vector))
  (with-geom2d-vector (_wrap_Geom2d_VectorWithMagnitude_Added (ff-pointer vector1)
							      (ff-pointer vector2))))

(defmethod divide! ((vector geom2d-vector-with-magnitude) (Scalar number))
  (_wrap_Geom2d_VectorWithMagnitude_Divide (ff-pointer vector) (coerce Scalar 'double-float)))

(defmethod divided ((vector geom2d-vector-with-magnitude) (Scalar number))
  (with-geom2d-vector
    (_wrap_Geom2d_VectorWithMagnitude_Divided (ff-pointer vector) (coerce Scalar 'double-float))))

(defmethod multiply! ((vector geom2d-vector-with-magnitude) (Scalar number))
  (_wrap_Geom2d_VectorWithMagnitude_Multiply (ff-pointer vector) (coerce Scalar 'double-float)))

(defmethod multiplied ((vector geom2d-vector-with-magnitude) (Scalar number))
  (with-geom2d-vector
    (_wrap_Geom2d_VectorWithMagnitude_Multiplied (ff-pointer vector) (coerce Scalar 'double-float))))

(defmethod normalize! ((vector geom2d-vector-with-magnitude))
  (_wrap_Geom2d_VectorWithMagnitude_Normalize (ff-pointer vector)))

(defmethod normalized ((vector geom2d-vector-with-magnitude))
  (with-geom2d-vector
    (_wrap_Geom2d_VectorWithMagnitude_Normalized (ff-pointer vector))))

(defmethod subtract! ((vector1 geom2d-vector-with-magnitude) (vector2 geom2d-vector))
  (_wrap_Geom2d_VectorWithMagnitude_Subtract (ff-pointer vector1) (ff-pointer vector2)))

(defmethod subtracted ((vector1 geom2d-vector-with-magnitude) (vector2 geom2d-vector))
  (with-geom2d-vector (_wrap_Geom2d_VectorWithMagnitude_Subtracted (ff-pointer vector1)
								   (ff-pointer vector2))))
