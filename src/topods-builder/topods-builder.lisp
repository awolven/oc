(in-package :oc)

(defmethod topods-builder-add ((self topods-builder) (S topods-shape) (C topods-shape))
  (_wrap_TopoDS_Builder_Add (ff-pointer self) (ff-pointer S) (ff-pointer C)))
