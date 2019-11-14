(in-package :oc)

(defmethod initialize-instance :after ((obj gc-make-segment) &rest initargs
				       &key P1 P2 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P1 'pnt))
  (assert (typep P2 'pnt))
  (setf (ff-pointer obj) (_wrap_new_GC_MakeSegment__SWIG_0 (ptr p1) (ptr p2)))
  (ff-pointer-finalize obj #'_wrap_delete_GC_MakeSegment)
  (values))

(defmethod value ((self gc-make-segment))
  (let ((curve (allocate-instance (load-time-value (find-class 'geom-trimmed-curve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeSegment_Value (ff-pointer self)))
    curve))
