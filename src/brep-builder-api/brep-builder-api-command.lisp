(in-package :oc)

(defmethod done? ((self brep-builder-api-command))
  (if (zerop (_wrap_BRepBuilderAPI_Command_IsDone (ff-pointer self)))
      nil
      t))
