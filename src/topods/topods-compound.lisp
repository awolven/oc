(in-package :oc)

(defmethod initialize-instance :after ((object topods-compound) &rest initargs)
  (declare (ignore initargs))
  (let ((pointer (_wrap_new_TopoDS_Compound)))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))
