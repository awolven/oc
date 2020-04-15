(in-package :oc)

(defmethod initialize-instance :after ((instance tcol-gp-array1-of-pnt2d)
				       &rest initargs
				       &key theUpper theLower
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and theLower theUpper)
		(_wrap_new_TColgp_Array1OfPnt2d theLower theUpper))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod set-value ((object tcol-gp-array1-of-pnt2d) (theIndex integer) (theValue gp::pnt2d))
  (_wrap_TColgp_Array1OfPnt2d_SetValue (ff-pointer object) theIndex (ptr theValue)))
