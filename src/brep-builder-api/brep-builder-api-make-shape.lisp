(in-package :oc)

(defmethod shape ((self brep-builder-api-make-shape))
  (let ((shape-copy
	 (with-topods-shape
	   (_wrap_TopoDS_Shape_copy_reference
	    (_wrap_BRepBuilderAPI_MakeShape_Shape (ff-pointer self))))))
    (oc:finalize shape-copy)
    shape-copy))
  
