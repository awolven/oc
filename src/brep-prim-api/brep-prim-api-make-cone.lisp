(in-package :oc)

(defmethod initialize-instance :after ((obj brep-prim-api-make-cone) &rest initargs
				       &key axes baseRadius topRadius height angle &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep axes 'gp:ax2))
  (assert (typep baseRadius 'double-float))
  (assert (typep topRadius 'double-float))
  (assert (typep height 'double-float))
  (assert (typep angle 'double-float))
  (setf (ff-pointer obj) (_wrap_new_BRepPrimAPI_MakeCone (ff-pointer axes) baseRadius topRadius height angle))
  (oc:finalize obj)
  (values))
