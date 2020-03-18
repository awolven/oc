(in-package :oc)

(defmethod initialize-instance :after ((object geom2d-trimmed-curve) &rest initargs
				       &key C U1 U2 Sense &allow-other-keys)
  (let ((pointer
	 (cond ((and C U1 U2 Sense)
		(_wrap_new_Geom2d_TrimmedCurve__SWIG_0 (ff-pointer C) (coerce U1 'double-float)
						       (coerce U2 'double-float)
						       (if Sense (if (zerop Sense) 0 1) 0)))
	       ((and C U1 U2)
		(_wrap_new_Geom2d_TrimmedCurve__SWIG_1 (ff-pointer C) (coerce U1 'double-float)
						       (coerce U2 'double-float)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))

(defmethod basis-curve ((curve geom2d-trimmed-curve))
  (with-geom2d-curve (_wrap_Geom2d_TrimmedCurve_BasisCurve (ff-pointer curve))))

(defmethod set-trim ((curve geom2d-trimmed-curve) (U1 real) (U2 real)
		     &optional (Sense t Sense-provided-p)
		       (theAdjustPeriodic t theAdjustPeriodic-provided-p))
  (if theAdjustPeriodic-provided-p
      (_wrap_Geom2d_TrimmedCurve_SetTrim__SWIG_0 (ff-pointer curve)
						 (coerce U1 'double-float)
						 (coerce U2 'double-float)
						 Sense theAdjustPeriodic)
      (if Sense-provided-p
	  (_wrap_Geom2d_TrimmedCurve_SetTrim__SWIG_1 (ff-pointer curve)
						 (coerce U1 'double-float)
						 (coerce U2 'double-float)
						 Sense)
	  (_wrap_Geom2d_TrimmedCurve_SetTrim__SWIG_2 (ff-pointer curve)
						     (coerce U1 'double-float)
						     (coerce U2 'double-float)))))
	  
