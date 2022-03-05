(in-package :oc)

(defmethod initialize-instance :after ((instance geom-circle)
				       &rest initargs &key A2 R)
  (let ((ff-pointer
	  (cond ((and (typep A2 'gp:ax2) (typep R 'double-float))
		 (_wrap_new_Geom_Circle (ptr A2) (coerce R 'double-float)))
		(t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod radius ((self geom-circle))
  (_wrap_Geom_Circle_Radius (ff-pointer self)))
