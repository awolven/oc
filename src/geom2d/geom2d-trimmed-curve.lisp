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
    (sb-ext:finalize
     object
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    (values)))

(defmethod basis-curve ((curve geom2d-trimmed-curve))
  (with-geom2d-curve (_wrap_Geom2d_TrimmedCurve_BasisCurve (ff-pointer curve))))
