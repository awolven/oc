(in-package :oc)

(defmethod initialize-instance :after ((obj brep-builder-api-transform) &rest initargs
				&key Trsf S Copy &allow-other-keys)
  (let ((pointer
	 (cond ((and S Trsf Copy)
		(_wrap_new_BRepBuilderAPI_Transform__SWIG_1 (ff-pointer S) (ptr Trsf) Copy))
	       ((and S Trsf)
		(_wrap_new_BRepBuilderAPI_Transform__SWIG_2 (ff-pointer S) (ptr Trsf)))
	       (S (_wrap_new_BrepBuilderAPI_Transform__SWIG_0 (ptr Trsf)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (oc:finalize obj)
    (values)))
