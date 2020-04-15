(in-package :oc)

(defmethod initialize-instance :after ((object top-tools-list-of-shape) &rest initargs
				       &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer object) (_wrap_new_TopTools_ListOfShape))
  (oc:finalize object)
  (values))

(defmethod list-append ((self top-tools-list-of-shape) (item topods-shape))
  (_wrap_TopTools_ListOfShape_Append (ff-pointer self) (ff-pointer item))
  (values))
