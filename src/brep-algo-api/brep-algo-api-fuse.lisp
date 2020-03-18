(in-package :oc)

(defmethod initialize-instance :after ((object brep-algo-api-fuse) &rest initargs
				       &key PF S1 S2 aDSF &allow-other-keys)
  (let ((pointer
	 (cond ((and S1 S2 (null PF) (null aDSF))
		(_wrap_new_BRepAlgoAPI_Fuse (ff-pointer S1) (ff-pointer S2)))
	       (t (error "Not fully implemented ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))
