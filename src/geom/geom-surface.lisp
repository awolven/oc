(in-package :oc)

(defmethod oc:bounds ((self geom-surface) &rest args)
  (declare (ignore args))
  (with-foreign-objects ((&u1 :double)
			 (&u2 :double)
			 (&v1 :double)
			 (&v2 :double))
    (_wrap_Geom_Surface_bounds (ff-pointer self) &u1 &u2 &v1 &v2)

    (values (mem-aref &u1 :double)
	    (mem-aref &u2 :double)
	    (mem-aref &v1 :double)
	    (mem-aref &v2 :double))))

(defmethod evaluate-surface ((surface geom-surface) (U number) (V number))
  ;; opencascade returns a gp_Pnt
  ;; the swig wrapper, however, returns a pointer to a new gp_Pnt (via copy constructor)
  ;; this needs a finalizer.
  (let* ((pointer (_wrap_Geom_Surface_Value (ff-pointer surface) (coerce U 'double-float) (coerce V 'double-float)))
	 (struct (gp::make-pnt :ptr pointer)))
    (oc:finalize struct)
    struct))
