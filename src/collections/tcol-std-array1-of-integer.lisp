(in-package :oc)

(defmethod initialize-instance :after ((instance tcol-std-array1-of-integer)
				       &rest initargs
				       &key theUpper theLower
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and theLower theUpper)
		(_wrap_new_TColStd_Array1OfInteger theLower theUpper))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (values)))

(defmethod set-value ((object tcol-std-array1-of-integer) (theIndex integer) (theValue integer))
  (with-foreign-object (p-value :int)
    (setf (mem-aref p-value :int) theValue)
    (_wrap_TColStd_Array1OfInteger_SetValue (ff-pointer object) theIndex p-value)
    (values)))

(defmethod get-value ((self tcol-std-array1-of-integer) (index integer))
  (_wrap_TColStd_Array1OfInteger_value (ff-pointer self) index))

(defmethod get-lower ((self tcol-std-array1-of-integer))
  (_wrap_TColStd_Array1OfInteger_Lower (ff-pointer self)))

(defmethod get-upper ((self tcol-std-array1-of-integer))
  (_wrap_TColStd_Array1OfInteger_Upper (ff-pointer self)))
