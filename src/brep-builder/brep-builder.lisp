(in-package :oc)

(defmethod initialize-instance :after ((obj brep-builder) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj) (_wrap_new_BRep_Builder))
  (ff-pointer-finalize obj #'_wrap_delete_BRep_Builder)
  (values))
