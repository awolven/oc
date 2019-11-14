(in-package :oc)

(defmethod initialize-instance :after ((object geom-cylindrical-surface) &rest initargs
				       &key A3 A2 Radius C &allow-other-keys)
  (let ((pointer
	 (cond ((and A3 Radius)
		(_wrap_new_Geom_CylindricalSurface__SWIG_0 (ptr A3) (coerce Radius 'double-float)))
	       ((and A2 Radius)
		(_wrap_new_Geom_CylindricalSurface__SWIG_1 (ptr A2) (coerce Radius 'double-float)))
	       (C (error "unimplemented constructor"))
	       (t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer object) pointer) ;; 
    (sb-ext:finalize
     object
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    (values)))
