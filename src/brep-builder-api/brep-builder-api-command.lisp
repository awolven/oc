(in-package :oc)

(defmethod done? ((self brep-builder-api-command))
  (_wrap_BRepBuilderAPI_Command_IsDone (ff-pointer self)))
