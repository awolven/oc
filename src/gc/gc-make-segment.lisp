(in-package :oc)

(defmethod initialize-instance :after ((obj gc-make-segment) &rest initargs
				       &key P1 P2 &allow-other-keys)
  (declare (ignore initargs))
  (assert (gp:pnt-p P1))
  (assert (gp:pnt-p P2))
  (setf (ff-pointer obj) (_wrap_new_GC_MakeSegment__SWIG_0 (ptr p1) (ptr p2)))
  (oc:finalize obj)
  (values))

(defmethod value ((self gc-make-segment))
  (let ((curve (allocate-instance (load-time-value (find-class 'geom-trimmed-curve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeSegment_Value (ff-pointer self)))
    (oc:finalize curve)
    curve))
