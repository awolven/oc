(in-package :oc)

(defmethod shape ((self brep-builder-api-make-shape))
  (with-topods-shape (_wrap_BRepBuilderAPI_MakeShape_Shape (ff-pointer self))))
