(in-package :oc)

(defmethod initialize-instance :after ((obj brep-builder) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj) (_wrap_new_BRep_Builder))
  (oc:finalize obj)
  (values))
