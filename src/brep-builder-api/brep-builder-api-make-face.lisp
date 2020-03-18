(in-package :oc)

(defmethod initialize-instance :after ((object brep-builder-api-make-face) &rest initargs
				       &key W OnlyPlane F S Inside Umin Umax Vmin Vmax tolDegen)
  (let ((pointer
	 (cond ((and S Umin Umax Vmin Vmax tolDegen)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_5 (ff-pointer S) Umin Umax Vmin Vmax tolDegen))
	       ((and S W Inside)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_3 (ff-pointer S) (ff-pointer W) Inside))
	       ((and S W)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_4 (ff-pointer S) (ff-pointer W)))
	       ((and F W)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_2 (ff-pointer F) (ff-pointer W)))
	       ((and W OnlyPlane)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_0 (ff-pointer W) OnlyPlane))
	       (W (_wrap_new_BRepBuilderAPI_MakeFace__SWIG_1 (ff-pointer W)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))

(defmethod face ((self brep-builder-api-make-face))
  (let ((face (allocate-instance (load-time-value (find-class 'topods-face)))))
    (setf (ff-pointer face) (_wrap_TopoDS_Shape_copy_reference
			     (_wrap_BrepBuilderAPI_MakeFace_Face (ff-pointer self))))
    face))
