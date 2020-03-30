(in-package :oc)

(defmethod initialize-instance :after ((instance tcol-std-array1-of-real)
				       &rest initargs
				       &key theUpper theLower
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and theLower theUpper)
		(_wrap_new_TColStd_Array1OfReal theLower theUpper))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    ;;(oc:finalize instance)
    (values)))

(defmethod set-value ((object tcol-std-array1-of-real) (theIndex integer) (theValue number))
  (with-foreign-object (p-value :double)
    (setf (mem-aref p-value :double) (coerce theValue 'double-float))
    (_wrap_TColStd_Array1OfReal_SetValue (ff-pointer object) theIndex p-value)
    (values)))
