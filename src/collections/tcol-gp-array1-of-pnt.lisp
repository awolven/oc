(in-package :oc)

(defmethod initialize-instance :after ((instance tcol-gp-array1-of-pnt)
				       &rest initargs
				       &key theUpper theLower
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and theLower theUpper)
		(_wrap_new_TColgp_Array1OfPnt theLower theUpper))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (values)))

(defmethod get-value ((self tcol-gp-array1-of-pnt) (index integer))
  (gp::make-pnt :ptr (_wrap_TColgp_Array1OfPnt_value (ff-pointer self) index)))

(defmethod get-lower ((self tcol-gp-array1-of-pnt))
  (_wrap_TColgp_Array1OfPnt_Lower (ff-pointer self)))

(defmethod get-upper ((self tcol-gp-array1-of-pnt))
  (_wrap_TColgp_Array1OfPnt_Upper (ff-pointer self)))

(defmethod set-value ((object tcol-gp-array1-of-pnt) (theIndex integer) (theValue gp::pnt))
  (_wrap_TColgp_Array1OfPnt_SetValue (ff-pointer object) theIndex (ptr theValue)))
