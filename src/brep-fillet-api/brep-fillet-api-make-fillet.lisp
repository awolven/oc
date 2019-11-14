(in-package :oc)

(defmethod initialize-instance :after ((object brep-fillet-api-make-fillet) &rest initargs
				       &key shape type)
  (let ((pointer
	 (cond ((and shape type)
		(_wrap_new_BRepFilletAPI_MakeFillet__SWIG_0 (ff-pointer shape) type))
	       (shape
		(_wrap_new_BRepFilletAPI_MakeFillet__SWIG_1 (ff-pointer shape)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepFilletAPI_MakeFillet)
    (values)))

(defmethod add-shape ((make-fillet brep-fillet-api-make-fillet) (radius number) (edge topods-edge))
  (_wrap_BRepFilletAPI_MakeFillet_Add (ff-pointer make-fillet) (coerce radius 'double-float) (ff-pointer edge)))
