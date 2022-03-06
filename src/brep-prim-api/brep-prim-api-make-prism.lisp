(in-package :oc)

(defmethod initialize-instance :after ((object brep-prim-api-make-prism) &rest initargs
				                       &key baseShape extrudeDirection
					                     (Copy nil Copy-supplied-p)
					                     (Canonize t Canonize-supplied-p) &allow-other-keys)
  (let ((pointer
	      (cond ((and Canonize-supplied-p Copy-supplied-p extrudeDirection baseShape)
		         (_wrap_new_BRepPrimAPI_MakePrism__SWIG_0 (ff-pointer baseShape)
							                              (ptr extrudeDirection)
							                              Copy
							                              Canonize))
	            ((and Copy-supplied-p extrudeDirection baseShape)
		         (_wrap_new_BRepPrimAPI_MakePrism__SWIG_1 (ff-pointer baseShape)
							                              (ptr extrudeDirection)
							                              Copy))
	            ((and extrudeDirection baseShape)
		         (_wrap_new_BRepPrimAPI_MakePrism__SWIG_2 (ff-pointer baseShape) (ptr extrudeDirection)))
	            (t (error "Invalid arguments for BRepPrimAPI_MakePrism constructor: ~S." initargs)))))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))

(defmethod last-shape ((object brep-prim-api-make-prism))
  (with-topods-shape (oc::_wrap_BRepPrimAPI_MakePrism_LastShape (ff-pointer object))))

(defmethod first-shape ((object brep-prim-api-make-prism))
  (with-topods-shape (oc::_wrap_BRepPrimAPI_MakePrism_FirstShape (ff-pointer object))))
