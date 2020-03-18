(in-package :oc)

(defmethod initialize-instance :after ((curve geom2d-offset-curve)
				       &rest initargs
				       &key C Offset &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep C 'geom2d-curve)
		     (realp Offset))
		(_wrap_new_Geom2d_OffsetCurve (ff-pointer C) (coerce Offset 'double-float)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer curve) ff-pointer)
    (oc:finalize curve)
    (values)))

(defmethod (setf basis-curve) ((c geom2d-curve) (offset-curve geom2d-offset-curve))
  (_wrap_Geom2d_OffsetCurve_SetBasisCurve__SWIG_1 (ff-pointer offset-curve)
						  (ff-pointer c))
  c)

(defmethod set-basis-curve ((offset-curve geom2d-offset-curve) (c geom2d-curve)
			    &optional (not-check-C0? nil not-check-c0?-supplied-p))
  (if not-check-c0?-supplied-p
      (_wrap_Geom2d_OffsetCurve_SetBasisCurve__SWIG_0 (ff-pointer offset-curve)
						      (ff-pointer c) not-check-c0?)
      (_wrap_Geom2d_OffsetCurve_SetBasisCurve__SWIG_1 (ff-pointer offset-curve)
						      (ff-pointer c))))

(defmethod (setf offset-value) ((d real) (offset-curve geom2d-offset-curve))
  (_wrap_Geom2d_OffsetCurve_SetOffsetValue (ff-pointer offset-curve) (coerce d 'double-float)))

(defmethod basis-curve ((offset-curve geom2d-offset-curve))
  (with-geom2d-curve (_wrap_Geom2d_OffsetCurve_BasisCurve (ff-pointer offset-curve))))

(defmethod offset-value ((offset-curve geom2d-offset-curve))
  (_wrap_Geom2d_OffsetCurve_Offset (ff-pointer offset-curve)))

(defmethod get-basis-curve-continuity ((offset-curve geom2d-offset-curve))
  (_wrap_Geom2d_OffsetCurve_GetBasisCurveContinuity (ff-pointer offset-curve)))

  
		     
	
