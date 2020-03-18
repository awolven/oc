(in-package :oc)

(defmethod shape ((self brep-builder-api-make-shape))
  (with-topods-shape
    (_wrap_TopoDS_Shape_copy_reference
     (_wrap_BRepBuilderAPI_MakeShape_Shape (ff-pointer self)))))
  
