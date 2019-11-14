(in-package :oc)

(defmethod initialize-instance :after ((obj gc-make-arc-of-circle) &rest initargs
				       &key P1 P2 Circ Sense P3 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P1 'pnt))
  (assert (typep P2 'pnt))
  (setf (ff-pointer obj)
	(cond ((and Circ Sense)
	       (assert (typep Circ 'circ))
	       (assert (typep Sense 'integer))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_1 Circ (ptr P1) (ptr P2) Sense))
	      (P3
	       (assert (typep P3 'pnt))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_0 (ptr P1) (ptr P2) (ptr P3)))
	      (t (error "Insufficient arguments to constructor."))))
  (ff-pointer-finalize obj #'_wrap_delete_GC_MakeArcOfCircle)
  (values))

(defmethod value ((self gc-make-arc-of-circle))
  (let ((curve (allocate-instance (load-time-value (find-class 'geom-trimmed-curve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeArcOfCircle_Value (ff-pointer self)))
    curve))
