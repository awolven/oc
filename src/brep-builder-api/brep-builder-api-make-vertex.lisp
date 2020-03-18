(in-package :oc)

(defmethod initialize-instance :after ((obj brep-builder-api-make-vertex) &rest initargs
				      &key P &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P 'gp:pnt))
  (setf (ff-pointer obj)
	(_wrap_new_BRepBuilderAPI_MakeVertex (ff-pointer P)))
  (oc:finalize obj)
  (values))
