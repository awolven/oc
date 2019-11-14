(in-package :oc)

(defmethod initialize-instance :after ((obj brep-prim-api-make-cylinder) &rest initargs
				       &key Axes R H Angle &allow-other-keys)
  (let ((pointer
	 (cond ((and Axes R H Angle)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_3 (ptr Axes) R H Angle))
	       ((and Axes R H)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_2 (ptr Axes) R H))
	       ((and R H Angle)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_1 R H Angle))
	       ((and R H)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_0 R H))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeCylinder)
    (values)))
